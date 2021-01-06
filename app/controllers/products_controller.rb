class ProductsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @q = Product.ransack(search_params)
    @products = @q.result.includes(:model, :color, :memory, :branch, :status, :import_histories).page(params[:page])
    @search_path = products_path
  end

  def show
    @product = Product.find(params[:id])
    @import_histories = ImportHistory.where("product_id = ?", @product.id)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      if params[:create_and_add]
        redirect_to new_product_path, notice: "Created successfully"
      else
        redirect_to products_path
      end
    else
  		render 'new'
  	end
  end
  
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
  		redirect_to products_path
    else
  		render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
    def product_params
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
    
    def search_params
      return unless params[:q]
      params.require(:q).permit(
        :model_name_eq,
        :model_manufacturer_id_eq,
        :color_name_eq,
        :memory_amount_eq,
        :branch_name_eq,
        :status_name_eq,
        :price_gteq,
        :price_lteq,
        :import_histories_created_at_gteq,
        :import_histories_created_at_lteq
      )
    end 

end
