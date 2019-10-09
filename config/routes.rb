require 'sidekiq/web'
Rails.application.routes.draw do
  root to: 'docs#index'

  get 'contact', to: 'contact#index'
  get 'contact/finish', to: 'contact#finish'
  post 'contact', to: 'contact#create'

  get '/privacy_policy', to: 'static#privacy'
  get '/404', to: 'static#not_found'
  get '/500', to: 'static#server_error'
  get '/502', to: 'static#bad_gateway'

  mount Sidekiq::Web, at: '/sidekiq'

  get '/docs/:filename', to: 'docs#show'
  get '/docs', to: 'docs#index'

  namespace :admin do
    resources :sites
    resources :docs
    resources :contacts, only: [:index, :show]
    resources :layouts
  end

  namespace :api do
    namespace :v1 do
      resources :access_logs, only: :create
      resources :access_ranking, only: :index
      resources :doc_images, only: :show
    end
  end
end
