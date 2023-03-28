require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  devise_for :employees

  devise_scope :employee do
    root to: "devise/sessions#new"
  end

  resources :charges
  namespace :admin do

    get 'projects/assign_project_new', to: 'projects#assign_project_new'
    post 'projects/assign_project', to: 'projects#assign_project'
    
    resources :employees, :projects, :issues, :attendences, :notices, :dashboard, :leaves, :courses

    root "dashboard#index"

  end

  namespace :hr do

    resources :employees, :issues, :attendences, :notices
    resources :dashboard, only: :index
    resources :leaves
    resources :courses, except: [:edit, :update]

    root "dashboard#index"
  end

  namespace :manager do

    get 'projects/assign_project_new', to: 'projects#assign_project_new'
    post 'projects/assign_project', to: 'projects#assign_project'
    resources :issues, :attendences
    resources :dashboard, only: :index
    resources :employees, :notices,:courses, :projects, only: [:index, :show]

    root "dashboard#index"
  end

  namespace :employee do

    # resources :employees, only: :index
    resources :dashboard, only: :index
    resources :employees, :notices, :projects, :courses, only: [:index, :show]
    resources :issues, :attendences

    root "dashboard#index"
  end

end
