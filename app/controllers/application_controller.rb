class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # include ApplicationHelper
  # after_action :check_current_user
  
  def after_sign_in_path_for(resource)
    # Destroy notice after 10 days
    Notice.expired_notices.destroy_all
    
    case resource.roles.first.name
    when "admin"
      return admin_root_path
    when "hr"
      return hr_root_path
    when "manager"
      return manager_root_path
    when "employee"
      return employee_root_path
    end
  end
  
  protected 
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :name, :post])
  end

end