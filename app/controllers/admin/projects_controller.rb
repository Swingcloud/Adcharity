class Admin::ProjectsController < ApplicationController
	before_action :find_project, :only => [:edit, :destroy, :update]


	def new
		@project=Project.new
	end

	def create
		@project=Project.new(params_permitted)
		@project.institute_id=1
		@project.save!
		redirect_to admin_projects_path
	end

	def update
		
		@project.update(params_permitted)
		flash[:notice]="編輯成功"
		redirect_to admin_projects_path
	end


	private

	def params_permitted
		params.require(:project).permit(:name, :description, :image) 
	end

	def find_project
		@project=Project.find(params[:id])
	end



end
