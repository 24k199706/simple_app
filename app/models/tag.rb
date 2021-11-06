class Tag < ApplicationRecord
    validates :tags, presence: true, length: {maximum:99}
    has_and_belongs_to_many :posts
    
end
