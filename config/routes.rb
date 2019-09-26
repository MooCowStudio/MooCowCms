require 'sidekiq/web'
Rails.application.routes.draw do

  mount Sidekiq::Web, at: '/sidekiq'

  get '/docs/:filename', to: 'docs#show'
  get '/docs', to: 'docs#index'

  namespace :admin do
    resources :sites
    resources :docs
    resources :layouts
  end

  namespace :api do
    namespace :v1 do
      resources :access_logs, only: :create
      resources :access_ranking, only: :index
    end
  end
end
