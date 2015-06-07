class PostsController < ApplicationController
  before_action :find_post, :only => [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]
  
  def index
    @posts = Post.order("created_at DESC").page(params[:page]).per(2)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, :notice => "Blog was saved!"
    else
      render 'new', :notice => "Shit don't work"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Blog updated/saved"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :slug, :image)
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  end
end
