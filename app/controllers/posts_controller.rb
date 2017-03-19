# frozen_string_literal: true
class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    #
  end

  def index
    #
  end

  private

  def post_to_create
    @post ||= Post.for current_user
  end
end
