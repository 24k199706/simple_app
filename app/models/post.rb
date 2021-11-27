class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes
    has_many :posttags
    has_many :tags
    mount_uploader :image, ImageUploader
    validates :user_id, presence: true
    
end
