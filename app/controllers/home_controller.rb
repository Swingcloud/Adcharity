class HomeController < ApplicationController

	def index 
		if current_user && !session[:ad_count]
			session[:ad_count] = 0
			puts session[:ad_count]
		end
		puts "------"
		puts session[:ad_count]
		puts "------"
		@advertisements= Advertisement.all
		@projects= Project.check_expired
		@project = Project.first
	end

	def about_us

	end
end
