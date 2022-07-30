class User < ApplicationRecord
    has_secure_password

    validates :email, presence:true, uniqueness:true

    has_many :posts, dependent: :nullify

    has_many :comments, dependent: :nullify

    def full_name
        self.first_name + " " + self.last_name
    end
end
