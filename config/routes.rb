Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :stores, only: %i(index show)
  get '/store_search', to: 'stores#search', as: :store_search
end