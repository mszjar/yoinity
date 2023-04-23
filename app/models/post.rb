class Post < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, :content, :photo, presence: true

  include PgSearch::Model
  pg_search_scope :search, against: [ :title, :content, :url ], using: {
    tsearch: { prefix: true }
  }
end
