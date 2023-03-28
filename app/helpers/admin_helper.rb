module AdminHelper
  def is_admin?
    if is_admin
      redirect_to admin_employees_path
    else
      root_path
    end
  end
  
end