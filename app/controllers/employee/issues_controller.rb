class Employee::IssuesController < Employee::BaseController
  def index
    @issues = current_employee.issues
  end

  def show
    @issue = issue
  end

  def new
    @issue = Issue.new  
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.employee_id = current_employee.id
    if @issue.save
      redirect_to [:employee, @issue]
    else
      render :new
    end
  end

  def edit
    @issue = issue
  end

  def update
    @issue = issue
    if @issue.update(issue_params)
      redirect_to [:employee, @issue]
    else
      render :new
    end
  end

  # def destroy
  # end

  protected

  def issue
    Issue.find_by(id: params[:id])
  end
  
  def issue_params  
    params.require(:issue).permit(:subject, :description, :priority, :employee_id)
  end
  
end