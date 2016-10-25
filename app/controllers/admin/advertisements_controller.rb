class Admin::AdvertisementsController < ApplicationController
  before_action :find_ad, :only => [:edit, :destroy, :update]
  before_action :authenticate_user!
  before_action :check_admin 

  def new
    @advertisement=Advertisement.new
  end

  def create
    @advertisement=Advertisement.new(params_permitted)
    @advertisement.save
    redirect_to admin_root_path
  end

  def edit
    @advertisement= Advertisement.find(params[:id])
  end

  def update
    @advertisement= Advertisement.find(params[:id])
    if @advertisement.update(params_permitted)
      flash[:notice] = "新增成功"
      redirect_to admin_root_path
    else
      render :action => :edit
  end

  private

  def params_permitted
    params.require(:advertisement).permit(:ad_href, :price_per_look) 
  end

  def find_ad
    @advertisement= Advertisement.find(params[:id])
  end

  private

  def check_admin
    unless current_user.admin?
      raise ActiceRecoed::RecordNotFound
      return
    end
    # authenticate_or_request_with_http_basic do |user_name, password| 很陽春的驗證流程
    #        user_name == "username" && password == "password"
    # end
  end
  

end
