# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Admin::DashboardController, type: :controller do
	# before do
	# 	# @user = Employee.create(email: "test@gmail.com",name: "test", post: "admin",password:"1234567")
	# 	# @link = Role.new(name: "admin")
	# 	# @user.roles << @link
	# 	@notice = Notice.create(subject: "Notice", description: 'Description')
	# end

  describe 'GET index' do
		it 'to index' do 
			get :index
			expect(response).to render_template(:index)
			# expect(@notices)to eq 
			# expect(@user)
		end	
	end
end

# require 'rails_helper'
# RSpec.describe Admin::DashboardController, type: :request do

# describe 'GET index' do
# 	it 'to index' do 
# 		get "/admin/dashboard"
# 		expect(@notices).to eq @notice 
# 		# expect(@user)
# 	end	
# end
# end