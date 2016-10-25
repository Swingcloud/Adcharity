class RecommendsController < ApplicationController
	before_action :authenticate_user!

	def index
		@recommend = recommend_type.new
	end

	def create
		@recommend = recommend_type.new(params_permitted)
		@recommend.save
		redirect_to root_path
		flash[:notice] = "謝謝您！"
	end


	private

	def params_permitted
		if params[:type] =='Person'
    	params.require(:person).permit(:recommend_user, :phone_number, :email, :recommend_inst, :description,:type,:category ) 
		else
			params.require(:company).permit(:recommend_user,:description,:phone_number, :email, :recommend_inst,:inst_project, :type)
		end
	end

	def recommend_types
		["Person", "Company"]
	end

	def recommend_type
		params[:type].constantize if params[:type].in? recommend_types
	end


end
