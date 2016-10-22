class AdvertisementsController < ApplicationController
	layout 'advertisement'

	def show
		if !user_signed_in?
			@advertisement = Advertisement.find_by_randomize
      @project= Project.find(params[:project_id])
    	cookies[:user_first_sign_up] = {
    		:value => @advertisement.id,
    		:expires => 5.minutes.from_now
    	}
    else
      if current_user.unwatch_ad.count > 0
        @project= Project.find(params[:project_id])
    	  @advertisement = Advertisement.find(current_user.unwatch_ad.sample(1)[0])
      else
        redirect_to root_path
        flash[:notice]= "目前沒有您未看過的廣告唷！"
      end  
   	end 	
	end

  def congrats
    render :layout => "congrats"
    if current_user
      @advertisement = Advertisement.find(params[:id])
      @project= Project.find(params[:p_id])
      UserAdship.create!( :user_id => current_user.id , :advertisement_id => @advertisement.id)
      if !current_user.projects.exists?(params[:p_id])
        current_user.user_projectships.update(:status => false)
        UserProjectship.create( :user_id => current_user.id , :project_id => params[:p_id], :status => true, :total_donation => 3)
      else
        current_user.user_projectships.update(:status => false)
        donate_prize = current_user.user_projectships.find_by_project_id(params[:p_id]).total_donation += 3
        current_user.user_projectships.find_by_project_id(params[:p_id]).update( :status => true, :total_donation => donate_prize)
      end 
    end
  end

  def we_love_you
    render :layout => "congrats"
  end

end
