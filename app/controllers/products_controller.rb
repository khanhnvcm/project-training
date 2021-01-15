class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: %i[show edit update update_import update_available update_sold destroy]

  def index
    @q = Product.ransack(search_params)
    @products = @q.result.includes(:model, :color, :memory, :branch, :status, :import_histories).page(params[:page])
    @search_path = products_path
  end

  def show
    @import_histories = @product.import_histories
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    return render 'new' unless @product.save

    ImportHistory.create(product_id: @product.id, branch_id: @product.branch_id)
    if params[:create_and_add]
      redirect_to new_product_path, notice: 'Created successfully'
    else
      redirect_to products_path, notice: 'Created successfully'
    end
  end

  def edit; end

  def update
    @product.assign_attributes(product_params)
    return render 'edit' unless @product.save

    if @product.branch_id_previously_changed?
      ImportHistory.create(product_id: @product.id, branch_id: @product.branch_id)
    end

    redirect_to product_path(@product), notice: 'Updated successfully'
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: 'Deleted successfully'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params # rubocop:disable Metrics/MethodLength
    params.require(:product).permit(
      :model_id,
      :memory_id,
      :color_id,
      :branch_id,
      :status_id,
      :price,
      :imei,
      :serial_number,
      :employee_id,
      :available,
      :sold,
      :description,
      images: []
    )
  end

  def search_params # rubocop:disable Metrics/MethodLength
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
