class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes
    has_many :posttags
    has_many :tags
    has_many :notifications, dependent: :destroy
    mount_uploader :image, ImageUploader
    validates :user_id, presence: true
end
