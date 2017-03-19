# frozen_string_literal: true
class Post < ApplicationRecord
  extend Enumerize
  extend FriendlyId

  belong_to :user

  validates :title, :content, :header, presence: true
  validates :title, uniqueness: true

  enumerize :status, in: [:draft, :publish], scope: true, predicates: true, default: :draft

  def self.for(user)
    user.posts.order(created_at: :desc)
  end
end
