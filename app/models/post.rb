# frozen_string_literal: true
class Post < ApplicationRecord
  extend Enumerize
  extend FriendlyId

  belongs_to :user

  has_many :taggings
  has_many :tags, through: :taggings, dependent: :destroy

  validates :title, :content, presence: true
  validates :title, uniqueness: true

  enumerize :status, in: [:draft, :published, :retire], scope: true, predicates: true, default: :draft
  friendly_id :title, use: [:slugged, :finders]

  def tag_list=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip.downcase).first_or_create!
    end
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def self.for(user)
    user.posts.order(created_at: :desc)
  end

  def self.ordered_published_posts
    with_status(:published).order(created_at: :desc)
  end
end
