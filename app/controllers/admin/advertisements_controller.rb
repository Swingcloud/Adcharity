class Admin::AdvertisementsController < ApplicationController
	before_action :find_ad, :only => [:edit, :destroy, :update]

	def new
		@advertisement=Advertisement.new
	end

	def create
		@advertisement=Advertisement.new(params_permitted)
		@advertisement.save
		redirect_to admin_root_path
	end

	private

	def params_permitted
		params.require(:advertisement).permit(:ad_href, :price_per_look) 
	end

	def find_ad
		@advertisement= Advertisement.find(params[:id])
		
	end
	

end
