class MemoriesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @memories = Memory.all
  end

  def new
    @memory = Memory.new
  end

  def create
    @memory = Memory.new(memory_params)
    if @memory.save
  		redirect_to memories_path
    else
  		render 'new'
  	end
  end
  
  def edit
    @memory = Memory.find(params[:id])
  end

  def update
    @memory = Memory.find(params[:id])
    if @memory.update(memory_params)
  		redirect_to memories_path
    else
  		render 'edit'
  	end
  end

  private
  def memory_params
    params.require(:memory).permit(:amount)
  end
end
