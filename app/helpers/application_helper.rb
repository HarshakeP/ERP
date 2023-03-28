module ApplicationHelper

  def check_role
    current_employee.roles.first.name
  end

  def is_admin
    check_role == "admin"
  end
  def is_hr
    check_role == "hr"
  end
  def is_manager
    check_role == "manager"
  end
  def is_employee
    check_role == "employee"
  end
end
