class UserController < ApplicationController

  def test
    @users = User.all
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to("/user/#{@user.id}")
    else
      render("user/login_form")
    end
  end

  def create_form
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image_name: "default.png"
    )
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/user/#{@user.id}")
    else
      render("user/create_form")
    end
  end

  def top
    @user = User.find_by(id: params[:id])
    @users = User.all
    @posts = @user.post.order(created_at: :desc)
  end

  def logout
    session[:user_id] = nil
    redirect_to("/")
  end

  def all
    @users = User.all
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.introduce = params[:introduce]
    
    if params[:image]
      @user.image_name = "#{@user.id}.png"
      image = params[:image]
      File.binwrite("public/#{@user.image_name}",image.read)
    end

    if @user.save 
      session[:user_id] = @user.id
      redirect_to("/user/#{@user.id}")
    else
      render("user/edit")
    end
  end

end
