class Post < ApplicationRecord
    validates :title, presence:true, uniqueness:true
    validates :body, presence:true, numericality: {greate_than_or_equal_to: 50}
end
