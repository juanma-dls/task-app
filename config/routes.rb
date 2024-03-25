Rails.application.routes.draw do
  get 'main/home'
  root to: "application#redirect_based_on_authentication"

  devise_for :users, skip: [:registrations]
  resources :users
  as :user do
    get 'profile/edit', to: 'users#edit_profile', as: 'edit_user_profile'
    patch 'profile/update', to: 'users#update_profile', as: 'update_user_profile'
  end

  resources :roles
  resources :projects

  resources :tasks, only: [:index, :new, :create, :show, :edit, :update] do
    resources :comments, only: [:new, :create, :update]
  end

  as :tasks do
    post 'iniciar_finalizar_task', to: 'tasks#iniciar_finalizar_task'
  end
end
