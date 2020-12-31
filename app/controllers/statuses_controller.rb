class StatusesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    if @status.save
  		redirect_to statuses_path
    else
  		render 'new'
  	end
  end
  
  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    if @status.update(status_params)
  		redirect_to statuses_path
    else
  		render 'edit'
  	end
  end

  private
  def status_params
    params.require(:status).permit(:name)
  end
end
