class ProjectsController < ApplicationController

	def show 
		@project=Project.find(params[:id])
		if current_user
			if !current_user.projects.exists?(params[:id])
				current_user.projects << @project
				current_user.user_projectships.update(:status => false)
				UserProjectship.create( :user_id => current_user.id , :project_id => params[:id], :status => true)
			else
				current_user.user_projectships.update(:status => false)
				current_user.user_projectships.find_by_project_id(params[:id]).update( :status => true)
			end	
		end
	end



end
