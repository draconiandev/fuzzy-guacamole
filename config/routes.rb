# frozen_string_literal: true
Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :posts
  get '/posts/:id/publish', to: 'posts#publish', as: :publish_post
  get '/posts/:id/draft',   to: 'posts#draft',   as: :draft_post
  get '/posts/:id/retire',  to: 'posts#retire',  as: :retire_post

  resources :tags
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
