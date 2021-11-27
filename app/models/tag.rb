class Tag < ApplicationRecord
    validates :tags, presence: true, length: {maximum:99}
    belongs_to :post
    has_many :posttags
    
end
