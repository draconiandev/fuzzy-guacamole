# frozen_string_literal: true
class Tag < ApplicationRecord
  extend FriendlyId

  has_many :taggings
  has_many :posts, through: :taggings

  validates :name, presence: true, uniqueness: true

  friendly_id :name, use: [:slugged, :finders]
end
