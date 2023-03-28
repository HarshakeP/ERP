class Employee::BaseController < ApplicationController
  # before_action :authenticate_employee

  def authenticate_employee
    if current_employee.roles.first.name != "employee"
      render template: "error"
    end
  end
end