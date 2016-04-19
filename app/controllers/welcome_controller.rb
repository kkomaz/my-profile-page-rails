class WelcomeController < ApplicationController
  def index
    @public_posts = Post.public_posts.limit(3).order("created_at DESC")
    @posts = Post.all.limit(3).order("created_at desc")
    @projects = Project.all.limit(3).order("created_at desc")
    @videos = Video.all.limit(3).order("created_at desc")
  end
end
