class Admin::InstitutesController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin 

	def new
		@institute = Institute.new
	end

	def create
		@institute = Institute.new(params_permitted)
		if @institute.save
    	redirect_to admin_root_path
  	else
  		render :action => :new
  	end
	end

	def edit
		@institute = Institute.find(params[:id])
	end

	def update
		@institute = Institute.find(params[:id])
		if @institute.update(params_permitted)
			flash[:notice]="編輯成功"
			redirect_to admin_root_path
		else
			render :action => :edit
		end
	end




	private

	def params_permitted
    params.require(:institute).permit(:name, :description, :icon, :telephone,:email,:address) 
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
