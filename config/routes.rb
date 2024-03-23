Rails.application.routes.draw do

  get 'main/home'
  # Defines the root path route ("/")
  root to: "application#redirect_based_on_authentication"

  devise_for :users, skip: [:registrations]
  resources :users
  as :user do
    get 'profile/edit', to: 'users#edit_profile', as: 'edit_user_profile'
    patch 'profile/update', to: 'users#update_profile', as: 'update_user_profile'
  end

  resources :roles
  resources :projects
  resources :tasks

  as :tasks do
    post 'iniciar_task', to: 'tasks#iniciar_task'
  end
end
