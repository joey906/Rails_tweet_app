class AddChatContentToChat < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :chat_content, :string
  end
end
