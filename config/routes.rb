Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/store_search', to: 'stores#search', as: :store_search
  get '/store', to: 'stores#show', as: :store
end