class User < ApplicationRecord
  has_many :posts
  mount_uploader :image, ImageUploader
  attr_accessor :remember_token
  validates :name, presence: true 
  has_secure_password
  #渡された文字列をハッシュ値に変更する
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  #永続セッションのためにユーザをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  #ユーザ情報を廃棄する（ログアウト時に）
  def forget
    update_attribute(:remember_digest, nil)
  end
end
