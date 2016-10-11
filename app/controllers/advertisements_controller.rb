class AdvertisementsController < ApplicationController

	def show
		@advertisement = Advertisement.find_by_randomize
	end

end
