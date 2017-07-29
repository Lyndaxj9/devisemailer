Rails.application.routes.draw do
  
  root to: 'pages#index'
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :articles do
    resources :comments
  end
  resources :contacts
  
  get 'pages/contact'
  get 'pages/about'
end
