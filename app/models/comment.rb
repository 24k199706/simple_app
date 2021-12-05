class Comment < ApplicationRecord
belongs_to :post
belongs_to :user
has_many :likes
has_many :notifications, dependent: :destroy
    
end
