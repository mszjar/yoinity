require 'securerandom'

class Post < ApplicationRecord
  before_create :generate_token

  has_one_attached :photo
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :post_qualities, dependent: :destroy
  has_many :saved_for_laters, dependent: :destroy
  has_many :users_who_saved, through: :saved_for_laters, source: :user
  has_and_belongs_to_many :categories, limit: 6

  validates :title, :content, :language, presence: true
  validates :title, length: { maximum: 100 }
  validates :content, length: { maximum: 4999 }


  include PgSearch::Model
  pg_search_scope :search, against: [ :title, :content, :language ],
    associated_against: { categories: [ :name ] },
    using: {
      tsearch: { prefix: true }
    }

  def speech_duration
    content.split.size / 150.0 # 150 words per minute
  end

  private

  def generate_token
    self.token = SecureRandom.urlsafe_base64(15) # secured roots for posts
  end
end
