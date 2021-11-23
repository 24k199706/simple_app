class Tag < ApplicationRecord
    validates :tags, presence: true, length: {maximum:99}
    belongs_to :post, belongs_to :hashtag_micropost
    
end
