class BranchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_branch, only: %i[show edit update]

  def index
    @branches = Branch.all
  end

  def show
    @q = @branch.products.ransack(search_params)
    @products = @q.result.includes(:model, :color, :memory, :branch, :status, :import_histories).page(params[:page])
    @search_path = branch_path(@branch)

    @employees = Employee.where(branch_id: @branch.id)
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

  def edit; end

  def update
    if @branch.update(branch_params)
      redirect_to branches_path
    else
      render 'edit'
    end
  end

  private

  def set_branch
    @branch = Branch.find(params[:id])
  end

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
