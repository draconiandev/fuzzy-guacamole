# frozen_string_literal: true
class Post < ApplicationRecord
  extend Enumerize
  extend FriendlyId

  belongs_to :user

  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, :content, :header, presence: true
  validates :title, uniqueness: true

  enumerize :status, in: [:draft, :published, :retire], scope: true, predicates: true, default: :draft
  friendly_id :title, use: [:slugged, :finders]

  def self.for(user)
    user.posts.order(created_at: :desc)
  end

  def self.ordered_published_posts
    with_status(:published).order(created_at: :desc)
  end
end
