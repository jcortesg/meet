Events::Application.routes.draw do
  resources :categories

  resources :communities

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end