class Admin::HomeController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin 

	def index
		@projects = Project.all
		@advertisements = Advertisement.all
    
	end

	def check_admin
  	unless current_user.admin?
  		raise ActiceRecoed::RecordNotFound
  		return
  	end
    # authenticate_or_request_with_http_basic do |user_name, password| 很陽春的驗證流程
    #        user_name == "username" && password == "password"
    # end
  end


end
