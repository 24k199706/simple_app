class PasswordAnsnwer < ApplicationRecord
    belongs_to_active_hash :password_question
    belongs_to :user
end
