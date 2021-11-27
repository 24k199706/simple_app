class Tag < ApplicationRecord
    validates :name, presence: true, length: {maximum:99}
    has_many :posttags
    
end
