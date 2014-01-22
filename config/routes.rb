Events::Application.routes.draw do
   
    resources :categories
    resources :meetings, :only => [:index] 
    resources :communities do
        resources :meetings
    end
 

  root :to => "home#index"
  
  devise_for :users, :controllers => {:registrations => "registrations",:omniauth_callbacks => "omniauth_callbacks" }
  
  resources :users
end
