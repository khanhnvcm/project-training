class ModelsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @models = Model.all
  end

  def show
    @model = Model.find(params[:id])

    @products = Product.where("model_id = ?", @model.id)
    @quantity_at_branches = Hash.new
    @products.pluck(:branch_id).each do |id|
      @quantity_at_branches[id] = @products.where('branch_id = ?', id).count
    end
    
  end

  def new
    @model = Model.new
  end

  def create
    @model = Model.new(model_params)
    if @model.save
  		redirect_to models_path
    else
      render 'new'
  	end
  end
  
  def edit
    @model = Model.find(params[:id])
  end

  def update
    @model = Model.find(params[:id])
    if @model.update(model_params)
  		redirect_to models_path
    else
  		render 'edit'
  	end
  end

  def destroy
    @model = Model.find(params[:id])
    @model.destroy
    redirect_to models_path, alert: "#{@model.errors.full_messages if @model.errors.any?}"
  end

  private
  def model_params
    params.require(:model).permit(:name, :battery, :camera, :display, :manufacturer_id, :detail, images: [])
  end

end
