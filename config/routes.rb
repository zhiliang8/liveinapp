Liveinapp::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :apps do 
    member do
      post :using
      post :comment
    end
    resources :comments
  end


  resources :nodes do
    resources :apps
  end

  devise_for :users, :path => 'account', :controllers => {:registrations => 'account'} do
    get '/dashboard' => 'account#index'
    get '/users/edit_avatar' => 'account#edit_avatar'
    get '/users/edit_password' => 'account#edit_password'
  end
  resources :users
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
