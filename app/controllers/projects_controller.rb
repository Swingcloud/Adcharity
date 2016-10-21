class ProjectsController < ApplicationController

	def show 
		@project=Project.find(params[:id])
	end

	def index
		@projects=Project.all

		if params[:category]
			@projects=Project.find_category(params[:category])
		end
		
	end



end
