class AdvertisementsController < ApplicationController
	layout 'advertisement'

	def show
		if !user_signed_in?
			@advertisement = Advertisement.find_by_randomize
    	cookies[:user_first_sign_up] = {
    		:value => @advertisement.id,
    		:expires => 5.minutes.from_now
    	}
    else
      if current_user.unwatch_ad.count > 0
    	 @advertisement = Advertisement.find(current_user.unwatch_ad.sample(1)[0])
      else
        redirect_to root_path
        flash[:notice]= "目前沒有您未看過的廣告唷！"
      end  
   	end 	
	end

  def congrats
    render :layout => "congrats"
    if user_signed_in?
      @advertisement = Advertisement.find(params[:id])
      UserAdship.create!( :user_id => current_user.id , :advertisement_id => @advertisement.id)
    end
  end

end
