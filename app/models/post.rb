class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes
    has_and_belongs_to_many :tags
    mount_uploader :image, ImageUploader
    validates :user_id, presence: true
    

    #after_create do
        #post = Post.find_by(id: self.id)
        #tags  = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
        #tags.uniq.map do |hashtag|
          #ハッシュタグは先頭の'#'を外した上で保存
          #tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
          #post.tags << tag
        #end
      #end
     
      #before_update do 
        #micropost = Micropost.find_by(id: self.id)
        #micropost.hashtags.clear
        #hashtags = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
        #hashtags.uniq.map do |hashtag|
          #tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
          #micropost.hashtags << tag
        #end
      #end
end
