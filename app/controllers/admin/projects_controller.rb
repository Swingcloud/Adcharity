class Admin::ProjectsController < ApplicationController
  before_action :find_project, :only => [:edit, :destroy, :update]


  def new
    @project=Project.new
    @institutes=Institute.all
  end

  def create
    @project=Project.new(params_permitted)
    @project.save!
    redirect_to admin_projects_path
  end

  def edit 
    @institutes=Institute.all
  end

  def update
    @project.update(params_permitted)
    flash[:notice]="編輯成功"
    redirect_to admin_projects_path
  end




  private

  def params_permitted
    params.require(:project).permit(:name, :description, :image, :institute_id, :short_text, :status) 
  end

  def find_project
    @project=Project.find(params[:id])
  end



end
