Rails.application.routes.draw do
  get 'api/authors'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'authors#index'
  resources :authors, :books
  resources :books do 
    resources :authors
  end

 resources :authors do 
    resources :books
  end
  
  namespace :api do
    resources :authors
  end
end
