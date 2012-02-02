Dota::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  ActiveAdmin.routes(self)
	
  devise_for :users, :path => 'accounts', :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'register' }
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :items
	resources :heros, :path => '/heroes' do
		resources :builds do
			member do			
				get "download"
			end
		end
	end
	
	resources :users do
		resources :builds
	end
   
	root :to => 'home#index'
	match 'heroes' => 'heros#index'
	match 'heroes/:id' => 'heros#show'
end
