class EmployeesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])

    @q = Product.where("employee_id = ?", @employee.id).ransack(search_params)
    @products = @q.result.includes(:model, :color, :memory, :branch, :status, :import_histories).page(params[:page])
    @search_path = employee_path(@employee)
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
  		redirect_to employees_path
    else
  		render 'new'
  	end
  end
  
  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
  		redirect_to employees_path
    else
  		render 'edit'
  	end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path, alert: "#{@employee.errors.full_messages if @employee.errors.any?}"
  end

  private

    def employee_params
      params.require(:employee).permit(:name, :position, :birthday, :phone, :email, :address, :branch_id, :image)
    end

    def search_params
      return unless params[:q]
      params.require(:q).permit(
        { model_name_in: [] },
        { model_manufacturer_id_in: [] },
        { color_name_in: [] },
        { memory_amount_in: [] },
        { branch_name_in: [] },
        { status_name_in: [] },
        :price_gteq,
        :price_lteq,
        :import_histories_created_at_gteq,
        :import_histories_created_at_lteq
      )
    end
end
