class MemoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_memory, only: %i[edit update]
  
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
  end

  def update
    if @memory.update(memory_params)
  		redirect_to memories_path
    else
  		render 'edit'
  	end
  end

  private
  def set_memory
    @memory = Memory.find(params[:id])
  end

  def memory_params
    params.require(:memory).permit(:amount)
  end
end
