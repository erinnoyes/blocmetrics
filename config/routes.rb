Rails.application.routes.draw do

  devise_for :users

  resources :registered_applications

  get 'welcome/index'

  get 'welcome/about'

  authenticated :user do
    root 'registered_applications#index', as: :authenticated_root
  end

  root 'welcome#index'
end
