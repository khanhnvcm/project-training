class ModelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_model, only: %i[show edit update destroy]
  
  def index
    @models = Model.all
  end

  def show
    @branch_with_models = Branch.distinct.joins(:products).where('products.model_id = ?', @model.id).order(:name)
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
  end

  def update
    if @model.update(model_params)
  		redirect_to models_path
    else
  		render 'edit'
  	end
  end

  def destroy
    @model.destroy
    redirect_to models_path, alert: "#{@model.errors.full_messages.join(', ') if @model.errors.any?}"
  end

  private
  def set_model
    @model = Model.find(params[:id])
  end

  def model_params
    params.require(:model).permit(:name, :battery, :camera, :display, :manufacturer_id, :detail, images: [])
  end

end
