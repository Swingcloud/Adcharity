class AdvertisementsController < ApplicationController
	layout 'advertisement'

	def show
		@advertisement = Advertisement.find_by_randomize
	end

end
