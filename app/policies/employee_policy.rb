class EmployeePolicy
  attr_reader :user, :employee

  def initialize(user, employee)
    @user = user
    @employee = employee
  end

  def index?
    @user.has_role? :admin
  end
end
