class HomeController < ApplicationController

	def index 
		@advertisements= Advertisement.all
		@projects= Project.all
		@project = Project.first
	end
end
