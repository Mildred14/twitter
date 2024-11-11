# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions' }

  authenticated do
    root to: 'posts#index', as: :authenticated_root
    resources :posts do
      resources :likes
      resources :saved
    end
  end
  root to: 'main#index'
end
