Liveinapp::Application.routes.draw do
  resources :apps

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :nodes

  devise_for :users, :path => 'account'
  resources :users
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
