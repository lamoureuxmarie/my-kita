Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :templates
  resources :kinder_gartens, only: %i[index show]
  resources :profiles, only: %i[show edit update]

end
