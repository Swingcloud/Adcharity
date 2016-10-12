Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }
  resources :users
  resources :projects do 
  	resources :advertisements
  end

  namespace :admin do 
  	resources :projects
    resource :advertisements
  	root "home#index", :controller => "home"
  end
  
	root to: "home#index" , :controller => "home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
