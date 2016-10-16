Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }
  resources :users, :only => [:show, :edit]
  resources :projects, :only => [:index ,:show] do 
  	resources :advertisements, :only => :show
  end

  namespace :admin do 
  	resources :projects
    resource :advertisements
  	root "home#index", :controller => "home"
  end
	root to: "home#index" , :controller => "home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
