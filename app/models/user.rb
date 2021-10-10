class User < ApplicationRecord
  has_many :posts
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  mount_uploader :image, ImageUploader
  attr_accessor :remember_token
  validates :name, presence: true 
  has_secure_password
  #フォローをする
  def follow(other_user)
    following << other_user
  end
  #フォローを解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  #現在フォローしているユーザーが存在している場合trueを返す
  def following?(other_user)
    following_include?(other_user)
  end

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
