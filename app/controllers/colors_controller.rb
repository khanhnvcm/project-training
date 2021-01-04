class ColorsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @colors = Color.all
  end

  def new
    @color = Color.new
  end

  def create
    @color = Color.new(color_params)
    if @color.save
  		redirect_to colors_path
    else
  		render 'new'
  	end
  end
  
  def edit
    @color = Color.find(params[:id])
  end

  def update
    @color = Color.find(params[:id])
    if @color.update(color_params)
  		redirect_to colors_path
    else
  		render 'edit'
  	end
  end

  private
  def color_params
    params.require(:color).permit(:name, :image)
  end
end
