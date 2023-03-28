class Manager::BaseController < ApplicationController
  # before_action :authenticate_employee

  def authenticate_employee
    if current_employee.roles.first.name != "manager"
      render template: "error"
    end
  end
end