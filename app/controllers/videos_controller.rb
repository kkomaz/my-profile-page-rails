class VideosController < ApplicationController
  before_action :find_video, :only => [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]
  def index
    @videos = Video.order("created_at DESC")
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to @video, :notice => "Screen cast was saved!"
    else
      render 'new', :notice => "shit don't work"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @video.update(video_params)
      redirect_to @video, :notice => "Video updated/saved"
    else
      render 'edit'
    end
  end

  def destroy
    if @video.destroy
      redirect_to videos_path
    end
  end

  private

  def video_params
    params.require(:video).permit(:title, :notes)
  end

  def find_video
    @video = Video.find(params[:id])
  end
end
