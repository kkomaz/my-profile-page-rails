class ProjectsController < ApplicationController
  before_action :find_project, :only => [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]
  def index
    @projects = Project.all.order("created_at DESC").page(params[:page]).per(3)
  end

  def new
    @project = Project.new
  end

  def edit
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

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project updated/saved"
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def project_params
    params.require(:project).permit(:title, :description, :link, :slug, :image)
  end

  def find_project
    @project = Project.friendly.find(params[:id])
  end
end
