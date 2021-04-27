class FrindsController < ApplicationController
  def create
    
    @friend = Fried.new
    @friend.user_id = @current_user.id
    @friend.frind_id = params[:friend_id]
    @friend.save
  
    redirect_to("/friends/all")
  end

  def all
    @friends = Fried.where(user_id: @current_user.id)
    @user = User.find_by(id: @current_user.id)
  end

  def friended_by
    @friended = Fried.where(frind_id: @current_user.id)
    redirect_to("/friends/friended")
  end

  def friended
    @user = User.find_by(id: @current_user.id)
    @friended = Fried.where(frind_id: @current_user.id)
  end

  def pre_chat 
    @user = User.find_by(id: params[:friend_id])
    @chat = Chat.find_by(chat_user: @current_user.id, send_to: @user.id)
    if @chat.present?
      @chats = @chat.all.order(created_at: :asc)
    end
    @chat_by = Chat.find_by(chat_user: @user.id, send_to: @current_user.id)
    if @chat_by.present?
      @chats_by = @chat_by.all.order(created_at: :asc)
    end
  end

  def chat_deco
    @user = User.find_by(id: params[:friend_id])
    @chat = Chat.new
    @chat.chat_user = @current_user.id
    @chat.send_to = @user.id
    @chat.chat_content = params[:chat]
    if @chat.save
      redirect_to("/friends/#{@user.id}")
    else
      render("frinds/pre_chat")
    end
  end
end
