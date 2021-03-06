Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }
  resources :users, :only => [:show, :edit]
  resources :projects, :only => [:index ,:show] do 
  	resources :advertisements, :only => [:show , :index]
    member do 
      get :institute
    end
  end
  resources :recommend_institutes, :controller => :recommends, :type => "Person"
  resources :project_proposals, :controller => :recommends, :type => "Company"
  get "congrats" => "advertisements#congrats"
  get "we_love_you" =>"advertisements#we_love_you"
  get "about_us"=>"home#about_us"
  namespace :admin do 
  	resources :projects
    resources :advertisements
    resources :institutes
  	root "home#index", :controller => "home"
  end
	root to: "home#index" , :controller => "home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
