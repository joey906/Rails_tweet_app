class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true

    def post
        return Post.where(user_id: self.id)
    end
end
