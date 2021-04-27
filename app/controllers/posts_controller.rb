class PostsController < ApplicationController
  def top
    @posts = Post.all.order(created_at: :desc)
    
  end

  def topmod
    @post = Post.new
    @post.user_id = "#{@current_user.id}"
    @post.content = params[:content]
    
    if @post.save
      redirect_to("/posts/top")
    else
      render("posts/new")
    end
  end

  def new
    @user = User.find_by(id: params[:user_id])
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    @post.save
    @user = @post.user
    redirect_to("/user/#{@user.id}")
  end
end
