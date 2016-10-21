class Admin::ProjectsController < ApplicationController
  before_action :find_project, :only => [:edit, :destroy, :update]


  def new
    @project=Project.new
    @institutes=Institute.all
  end

  def create
    @project=Project.new(params_permitted)
    if @project.save
      redirect_to admin_root_path
    else
      render :action => :new
    end
  end


  def edit 
    @institutes=Institute.all
  end

  def update
    @institutes=Institute.all
    if params[:remove_upload_file] == "1"
      @post.image = nil
    end


    if @project.update(params_permitted)
      flash[:notice]="編輯成功"
      redirect_to project_path(@project)
    else 
      render :action => :edit
    end

  end





  private

  def params_permitted
    params.require(:project).permit(:name, :description, :image, :institute_id, :short_text, :status,:donate_amount, :deadline, :category ) 
  end

  def find_project
    @project=Project.find(params[:id])
  end



end
