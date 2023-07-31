require 'faker'
require "open-uri"

class User < ApplicationRecord
  before_save :downcase_nickname
  before_save :add_default_avatar, if: Proc.new { |user| !user.photo.attached? }

  has_one_attached :photo
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :post_qualities, dependent: :destroy
  has_many :comment_replies, dependent: :destroy
  has_many :comment_likes, dependent: :destroy
  has_many :comment_dislikes, dependent: :destroy
  has_many :comment_reply_likes, dependent: :destroy
  has_many :remixes, dependent: :destroy
  has_many :ephemeral_remixes, dependent: :destroy


  has_many :saved_for_laters, dependent: :destroy
  has_many :saved_posts, through: :saved_for_laters, source: :post

  validates :nickname, presence: true, uniqueness: { case_sensitive: false }
  validates :nickname, length: { maximum: 25 }
  validates :stripe_subscription_id, presence: true, if: -> { subscription_status == 'active' }

  acts_as_followable
  acts_as_follower

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def create_subscription(stripe_subscription_id)
    subscription = Subscription.create(user: self, stripe_subscription_id: stripe_subscription_id)
    if subscription.persisted?
      self.stripe_subscription_id = stripe_subscription_id
      self.subscription_status = 'active'
      save
    end
    subscription
  end

  private

  def downcase_nickname
    self.nickname.downcase!
  end

  def add_default_avatar
    puts "add_default_avatar is being called"
    file = URI.open(Faker::Avatar.image)
    self.photo.attach(io: file, filename: "avatar-#{SecureRandom.hex}.png", content_type: 'image/png')
    puts "photo attached? #{self.photo.attached?}"
  end

  def self.suggested_users(current_user)
    User.all_except(current_user).sort_by{ |user| -user.followers_count }.first(10)
  end

  def self.all_except(user)
    where.not(id: user.id)
  end

end
