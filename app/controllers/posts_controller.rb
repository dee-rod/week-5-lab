class PostsController < ApplicationController
  def index
    @posts = Post.all.order("votes desc")
    render :index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new params.require(:post).permit(:title, :body, :link)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def upvote
    @post = Post.find params[:id]
    @post.votes += 1
    @post.save
    redirect_to root_path
  end

  def downvote
    @post = Post.find params[:id]
    @post.votes -= 1
    @post.save
    redirect_to root_path
  end

  def delete
    @post = Post.find params[:id]
    @post.delete
    redirect_to root_path
  end
end
