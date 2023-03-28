class Admin::EmployeesController < Admin::BaseController

  def index
    @employees = Employee.all
  end
  def show
    @employee = employee
    # @attendences = @employee.attendences
  end

  def new
    @employee = Employee.new
  end

  def create
    role = params[:employee].delete :role
    # result = Cloudinary::Uploader.upload(params[:employee][:image],:folder => "Erp")
    @employee = Employee.new(params_employees)
    # @employee.image = result['url']
    if @employee.save
      Employee.last.add_role(role) if Employee.last.roles.blank?
      redirect_to [:admin, @employee]
    else
      render :new
    end
  end

  def edit
    @employee = employee
  end

  def update
    role = params[:employee].delete :role
    @employee = employee
    if @employee.update(params_employees)
      if @employee.roles.first.name != role && role.present?
        @employee.roles.clear
        @employee.add_role(role) if @employee.roles.blank?
      end
      redirect_to [:admin, @employee]
    else
      render :new
    end
  end

  def destroy
    @employee = employee

    if @employee.destroy
      redirect_to admin_employees_path
    else
      redirect_to admin_employees_path
    end
  end

  protected

  def employee
    Employee.find_by(id: params[:id])
  end

  def params_employees
    if params[:employee][:password].present?
      params.require(:employee).permit(:email, :password, :password_confirmation, :name, :post, :image)
    else
      params.require(:employee).permit(:email, :name, :post)
    end
  end

end
