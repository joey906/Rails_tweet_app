class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.string :chat_user
      t.string :send_to

      t.timestamps
    end
  end
end
