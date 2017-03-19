# frozen_string_literal: true
class Post < ApplicationRecord
  belong_to :user

  validates :title, :content, :header, presence: true
  validates :title, uniqueness: true
end
