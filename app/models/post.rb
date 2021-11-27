class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes
    has_many :posttags
    mount_uploader :image, ImageUploader
    validates :user_id, presence: true
    
end
