class ManufacturersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @manufacturers = Manufacturer.all
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
  		redirect_to manufacturers_path
    else
  		render 'new'
  	end
  end
  
  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
    if @manufacturer.update(manufacturer_params)
  		redirect_to manufacturers_path
    else
  		render 'edit'
  	end
  end

  private
  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end

end
