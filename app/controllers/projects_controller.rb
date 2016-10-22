class ProjectsController < ApplicationController

	def show 
		@project=Project.find(params[:id])
		
		respond_to do |format|
			format.html
			format.js
		end
	end

	def index
		@projects=Project.check_expired

		if params[:category]
			@projects=Project.check_expired.find_category(params[:category])
		end
		
	end

	def institute
		@institute = Project.find(params[:id]).institute
		respond_to do |format|
			format.js
		end
	end



end
