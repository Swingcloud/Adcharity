class AdvertisementsController < ApplicationController
	layout 'advertisement'

	def show
    if session[:ad_count] > 0
      session[:ad_count] = 0
    end
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
        UserAdship.create( :user_id => current_user.id , :advertisement_id => @advertisement.id)
        session[:focus_project] = @project.id
        session[:ad_count] += 3
        puts "----------"
        puts session[:ad_count]
        puts "-----------"
      else
        redirect_to root_path
        flash[:notice]= "目前沒有您未看過的廣告唷！"
      end  
   	end 	
	end

  def congrats
    render :layout => "congrats"
    @project= Project.find(params[:p_id])
  end

  def we_love_you
    render :layout => "congrats"
    if current_user
      if !current_user.projects.exists?(session[:focus_project])
        current_user.user_projectships.update(:status => false)
        UserProjectship.create( :user_id => current_user.id , :project_id => session[:focus_project], :status => true, :total_donation => session[:ad_count])
        session[:focus_project] = nil
      else
        current_user.user_projectships.update(:status => false)
        donate_prize = current_user.user_projectships.find_by_project_id(session[:focus_project]).total_donation += session[:ad_count]
        current_user.user_projectships.find_by_project_id(session[:focus_project]).update( :status => true, :total_donation => donate_prize)
        session[:focus_project] = nil
      end 
    end

  end

end
