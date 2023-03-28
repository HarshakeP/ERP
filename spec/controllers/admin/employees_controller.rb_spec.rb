require 'rails_helper'

RSpec.describe Admin::EmployeesController, type: :controller do
  describe "GET index" do
    it "index" do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end
  end

  describe "GET show" do
    before do
      Employee.create(email: "test@gmail.com", name: "test", post: "developer", password: "password", password_confirmation: "password")
    end
    it "show" do
      get :show, params:{id: Employee.last.id}
      expect(response.status).to eq(200)
      expect(response).to redirect_to ("/admin/employees/#{Employee.last.id}")
    end
  end

  describe "GET new" do
    it "new" do
      get :new
      expect(response.status).to eq(200)
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    it "create" do
      post :create, :params =>{employee: {email: "test@gmail.com", name: "test", post: "developer", password: "password", password_confirmation: "password", role: "hr"}}
      expect(response).to redirect_to ("/admin/employees/#{Employee.last.id}")
    end
    it "while it throw an error" do
      post :create, :params =>{employee: {email: "test@gmail.com", name: "test", password: "password", password_confirmation: "password", role: "hr"}}
      # allow_any_instance_of(Employee).to receive(:save).and_return(false)
      expect(response).to render_template(:new)
    end
  end
end
