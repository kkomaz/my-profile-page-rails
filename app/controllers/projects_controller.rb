class ProjectsController < ApplicationController
  before_action :find_project, :only => [:show, :edit, :update, :destroy]
  def index
    @projects = Project.all.order("created_at DESC")
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: "success!"
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def project_params
    params.require(:project).permit(:title, :description, :link)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
