Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :templates
  resources :kinder_gartens, only: %i[index show] do
    resources :bookmarks, only: %i[new create]
  end
  resources :profiles, only: %i[show edit update]
  resources :bookmarks, only: %i[index show edit update destroy] do
    resources :reminders, only: %i[new create]
  end
  resources :reminders, only: %i[index show edit update destroy]
  post "reminder/message", to: "reminders#message"
end
