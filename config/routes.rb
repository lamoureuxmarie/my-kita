Rails.application.routes.draw do
  devise_for :users
  require "sidekiq/web"
  root to: "pages#home"

  resources :templates

  resources :kinder_gartens, only: %i[index show] do
    resources :bookmarks, only: %i[new create]
    resources :ratings, only: %i[new create]
  end

  resources :profiles, only: %i[show edit update]

  resources :bookmarks, only: %i[index show edit update destroy] do
    resources :reminders, only: %i[new create]

    member do
      patch :change_status
    end

    resources :templates, only: %i[new create]

  end

  resources :reminders, only: %i[index show edit update destroy]

  resources :templates, only: %i[index show edit update destroy]

  post "reminder/message", to: "reminders#message"

  get "job/fetch_id", to: "jobs#fetch_id"



  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'

  mount Sidekiq::Web => '/sidekiq'
end
