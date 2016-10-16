class Admin::HomeController < ApplicationController

	def index
		@projects = Project.all
		@advertisements = Advertisement.all
    
	end



end
