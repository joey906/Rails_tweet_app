class Chat < ApplicationRecord

    validates :chat_user, presence: true
    validates :send_to, presence: true
    validates :chat_content, presence: true

    def all
        return Chat.where(chat_user: self.chat_user, send_to: self.send_to)
    end

    def all_by
        return Chat.where(chat_user: self.send_to, send_to: self.chat_user)
    end
end
