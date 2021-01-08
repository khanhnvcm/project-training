class StatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_status, only: %i[edit update]
  
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
  end

  def update
    if @status.update(status_params)
  		redirect_to statuses_path
    else
  		render 'edit'
  	end
  end

  private
  def set_status
    @status = Status.find(params[:id])
  end

  def status_params
    params.require(:status).permit(:name)
  end
end
