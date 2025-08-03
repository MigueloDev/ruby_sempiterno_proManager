Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root "dashboard#index"
  get 'dashboard', to: 'dashboard#index'

  resources :users, only: [:index, :show]
  resources :projects do
    resources :tasks, only: [:new, :create]
  end
  resources :tasks, except: [:new, :create] do
    member do
      patch :mark_completed
      patch :mark_in_progress
      patch :assign_user
    end
  end
end
