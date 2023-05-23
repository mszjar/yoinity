class User < ApplicationRecord
  before_save :downcase_nickname

  has_one_attached :photo
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :post_qualities, dependent: :destroy
  has_many :comment_replies, dependent: :destroy
  has_many :comment_likes, dependent: :destroy
  has_many :comment_dislikes, dependent: :destroy
  has_many :comment_reply_likes, dependent: :destroy


  has_many :saved_for_laters, dependent: :destroy
  has_many :saved_posts, through: :saved_for_laters, source: :post

  validates :nickname, presence: true
  validates :nickname, length: { maximum: 25 }

  acts_as_followable
  acts_as_follower

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Stripe subscription
  def create_subscription(stripe_subscription_id:)
    self.stripe_subscription_id = stripe_subscription_id
    self.subscription_status = 'active'
    save
  end

  # Downcase nickname before saving to database
  private

  def downcase_nickname
    self.nickname.downcase!
  end
end
