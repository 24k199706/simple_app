class Posttag < ApplicationRecord
    belongs_to :post
    belongs_to :tag

    after_create do
        post = post.find_by(id: self.id)
        hashtags  = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
        post.posttags = []
        hashtags.uniq.map do |hashtag|
          #ハッシュタグは先頭の'#'を外した上で保存
          tag = Posttag.find_or_create_by(name: hashtag.downcase.delete('#'))
          post.posttags << tag
        end
    end
    before_update do 
        post = Post.find_by(id: self.id)
        post.hashtags.clear
        hashtags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
        hashtags.uniq.map do |hashtag|
          tag = Posttag.find_or_create_by(name: hashtag.downcase.delete('#'))
          post.posttags << tag
        end
      end
end
