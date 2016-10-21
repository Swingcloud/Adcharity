class ProjectsController < ApplicationController

	def show 
		@project=Project.find(params[:id])
	end

	def index
		@projects=Project.check_expired

		if params[:category]
			@projects=Project.check_expired.find_category(params[:category])
		end
		
	end



end
