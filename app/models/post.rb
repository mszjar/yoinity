class Post < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :post_qualities, dependent: :destroy

  has_many :saved_for_laters, dependent: :destroy
  has_many :users_who_saved, through: :saved_for_laters, source: :user

  validates :title, :content, presence: true

  include PgSearch::Model
  pg_search_scope :search, against: [ :title, :content, :url ], using: {
    tsearch: { prefix: true }
  }
end
