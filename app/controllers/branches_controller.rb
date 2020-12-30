class BranchesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @branches = Branch.all
  end

  def new
    @branch = Branch.new
  end

  def create
    @branch = Branch.new(branch_params)
    if @branch.save
  		redirect_to branches_path
    else
  		render 'new'
  	end
  end
  
  def edit
    @branch = Branch.find(params[:id])
  end

  def update
    @branch = Branch.find(params[:id])
    if @branch.update(branch_params)
  		redirect_to branches_path
    else
  		render 'edit'
  	end
  end

  private
  def branch_params
    params.require(:branch).permit(:name, :city, :address, :phone, :email)
  end

end
