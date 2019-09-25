require 'sidekiq/web'
Rails.application.routes.draw do

  mount Sidekiq::Web, at: '/sidekiq'

  namespace :admin do
    resources :sites
    resources :docs
  end
end
