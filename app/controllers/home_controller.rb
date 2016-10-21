class HomeController < ApplicationController

	def index 
		@advertisements= Advertisement.all
		@projects= Project.check_expired
		@project = Project.first
	end
end
