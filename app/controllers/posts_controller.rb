class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  def new
    @posts = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: "Post created successfully."
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
