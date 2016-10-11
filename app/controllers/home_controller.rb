class HomeController < ApplicationController

	def index 
		@advertisements= Advertisement.all
		@projects= Project.all
	end
end
