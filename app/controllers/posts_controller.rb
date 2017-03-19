# frozen_string_literal: true
class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: :show

  def new
    @post = post_to_create.new
  end

  def create
    @post = post_to_create.new post_params
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
    @posts = Post.all
  end

  def show; end

  private

  def find_post
    @post ||= Post.find params[:id]
  end

  def post_to_create
    @post_to_create ||= Post.for current_user
  end
end
