class PostsController < ApplicationController


  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :authorize_author, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def post_params
  params.require(:post).permit(:title, :description, :published_at)
end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.author != current_author
      flash[:alert] = "You are not authorized to perform this action"
      redirect_to root_path
    else
      @post.destroy
      flash[:notice] = "Post was successfully deleted"
      redirect_to posts_path
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :description, :published_at)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  def authorize_author
    unless @post.author_id == current_author.id
      redirect_to root_url, alert: "You are not authorized to perform this action."
    end
  end

  
end
