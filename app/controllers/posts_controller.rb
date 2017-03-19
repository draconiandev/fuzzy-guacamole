# frozen_string_literal: true
class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:show, :draft, :publish, :retire]

  def new
    @post = post_to_create.new
  end

  def create
    @post = post_to_create.new post_params
    @post.status = :draft
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessible_entity }
      end
    end
  end

  def index
    @posts = Post.ordered_published_posts
  end

  def show; end

  def draft
    @post.update_attributes(status: :draft)
  end

  def publish
    @post.update_attributes(status: :published)
  end

  def retire
    @post.update_attributes(status: :retire)
  end

  private

  def find_post
    @post = Post.find params[:id]
  end

  def post_to_create
    @post_to_create ||= Post.for current_user
  end
end
