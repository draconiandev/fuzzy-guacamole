# frozen_string_literal: true
class User < ApplicationRecord
  has_many :posts

  validates :email, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
end
