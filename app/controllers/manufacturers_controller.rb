class ManufacturersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_manufacturer, only: %i[edit update]
  
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
  end

  def update
    if @manufacturer.update(manufacturer_params)
  		redirect_to manufacturers_path
    else
  		render 'edit'
  	end
  end

  private
  def set_manufacturer
    @manufacturer = Manufacturer.find(params[:id])
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end

end
