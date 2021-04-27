class Fried < ApplicationRecord

    def user_friend
        return User.find_by(id: self.frind_id)
    end

    def user_friended
        return User.find_by(id: self.user_id)
    end
end
