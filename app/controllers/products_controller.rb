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
      ImportHistory.create(product_id: @product.id, branch_id: @product.branch_id)
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

    if params[:update_import]
      if (@product.branch_id.to_s != params[:product][:branch_id])
        @product.update(product_params)
        ImportHistory.create(product_id: @product.id, branch_id: @product.branch_id)
        redirect_to product_path(@product), notice: "Updated successfully"
      else
        redirect_to product_path(@product), alert: "Cannot update because the product is already at this branch"
      end

    elsif params[:update_available]
      if @product.available.to_s != params[:product][:available]
        @product.update(product_params)
        redirect_to product_path(@product), notice: "Updated successfully"
      else
        redirect_to product_path(@product), alert: "Cannot update because duplicate value"
      end

    elsif params[:update_sold]
      if @product.sold.to_s != params[:product][:sold]
        @product.update(product_params)
        redirect_to product_path(@product), notice: "Updated successfully"
      else
        redirect_to product_path(@product), alert: "Cannot update because duplicate value"
      end

    else
      if @product.update(product_params)
        redirect_to products_path, notice: "Updated successfully"
      else
        render 'edit'
      end

    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: "Deleted successfully"
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
