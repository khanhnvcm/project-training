class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee, only: %i[show edit update destroy]

  def index
    @employees = Employee.all
    authorize @employees
  end

  def show
    @q = @employee.products.ransack(search_params)
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

  def edit; end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path
    else
      render 'edit'
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path, alert: (@employee.errors.full_messages.join(', ') if @employee.errors.any?).to_s
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :position, :birthday, :phone, :email, :address, :branch_id, :image)
  end

  def search_params # rubocop:disable Metrics/MethodLength
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
