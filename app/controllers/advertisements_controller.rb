class AdvertisementsController < ApplicationController
	layout 'advertisement'

	def show
		@advertisement = Advertisement.find_by_randomize
		puts @advertisement
    cookies[:user_first_sign_up] = {
    	:value => @advertisement.id,
    	:expires => 2.minutes.from_now
    }
	end

end
