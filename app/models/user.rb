# frozen_string_literal: true
class User < ApplicationRecord
  extend Enumerize
  has_many :posts

  validates :email, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  enumerize :role, in: [:user, :editor, :admin], scope: true, predicates: true, default: :user
end
