class User < ApplicationRecord
  has_one_attached :photo
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :post_qualities, dependent: :destroy

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
end
