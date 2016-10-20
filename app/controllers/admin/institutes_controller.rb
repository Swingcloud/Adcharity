class Admin::InstitutesController < ApplicationController

	def new
		@institute = Institute.new
	end

	def create
		@institute = Institute.new(params_permitted)
		if @institute.save
    	redirect_to admin_root_path
  	else
  		render :action => :new
  	end
	end




	private

	def params_permitted
    params.require(:institute).permit(:name, :description, :icon, :telephone,:email,:address) 
  end
end
