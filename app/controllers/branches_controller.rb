class BranchesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @branches = Branch.all
  end

  def show
    @branch = Branch.find(params[:id])

    @q = Product.where("branch_id = ?", @branch.id).ransack(search_params)
    @products = @q.result.includes(:model, :color, :memory, :branch, :status, :import_histories).page(params[:page])
    @search_path = branch_path(@branch)

    @employees = Employee.where("branch_id = ?", @branch.id)
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

    def search_params
      return unless params[:q]
      params.require(:q).permit(
        { model_name_in: [] },
        { model_manufacturer_id_in: [] },
        { color_name_in: [] },
        { memory_amount_in: [] },
        { branch_name_in: [] },
        { status_name_in: [] },
        :price_gteq,
        :price_lteq,
        :import_histories_created_at_gteq,
        :import_histories_created_at_lteq
      )
    end

end
