Rails.application.routes.draw do
  resources :events do
    member do
      get 'register', to: 'events#register', as: 'register'
      get 'unregister', to: 'events#unregister', as: 'unregister'
    end
  end
  get 'matching', to: 'users#matching', as: 'matching'
  get 'profiles/:id', to: 'users#show', as: 'user_profile'
  get 'profile', to: 'users#show', as: 'user_show'
  get 'profile/edit', to: 'users#edit', as: 'user_edit'
  patch 'profile/edit', to: 'users#update', as: 'user_update'
  root to: 'visitors#index'
  devise_for :users
end
