Rails.application.routes.draw do
  # devise_for :athletes
  # devise_for :athletes, :controllers => { registrations: 'registrations' }
  devise_for :athletes, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  
  resources :athletes do 
    collection do
      post 'save'
    end
  end
  resources :omniauth_callbacks
  resources :scores
  resources :teams
  resources :schools
  resources :comments
  resources :likes
  resources :athletes do
    resources :comments
    resources :likes
  end
  resources :games do
    resources :comments
    resources :likes
  end

  resources :schools do
    collection do
      post 'search'
    end
  end

  devise_scope :athlete do
    get "update_team", to: "devise/registrations#update_team"
  end
  # get "registrations/:id/update_teams" => "registrations#update_teams"
  
  get "/update_teams" => "games#update_teams"
  get "/update_teams2" => "games#update_teams2"
  get "/likes_new" => "likes#new"
  get "/likes_delete" => "likes#delete"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'athletes#index'
  # post "schools/search" => "schools#search"
  #post "athletes/new_athlete" => "athletes#new_athlete"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
