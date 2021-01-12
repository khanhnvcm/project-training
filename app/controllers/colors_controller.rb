class ColorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_color, only: %i[edit update]

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

  def edit; end

  def update
    if @color.update(color_params)
      redirect_to colors_path
    else
      render 'edit'
    end
  end

  private

  def set_color
    @color = Color.find(params[:id])
  end

  def color_params
    params.require(:color).permit(:name, :image)
  end
end
