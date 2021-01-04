class ModelsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @models = Model.all
  end

  def show
    @model = Model.find(params[:id])
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
    redirect_to models_path
  end

  private
  def model_params
    params.require(:model).permit(:name, :battery, :camera, :display, :manufacturer_id, :detail, images: [])
  end

end
