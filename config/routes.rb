require 'sidekiq/web'

Rails.application.routes.draw do
  resources :cards, only: [:index, :destroy]

  resources :projects do
    resources :boards, only: :show
    resources :cards
  end

  get 'home/index'
  root 'home#index'
  mount Sidekiq::Web => "/sidekiq"
end
