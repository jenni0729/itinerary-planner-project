Rails.application.routes.draw do
  root 'users#login'

  get '/test', to: 'mandrill#test_form', as: "test_form"
  post '/test', to: 'mandrill#test', as: "test"
  post '/emails', to: 'mandrill#email', as: "email"

  get '/login', to: 'users#login', as: "login"
  get '/signup', to: 'users#signup', as: "signup"
  get '/home', to: 'users#home', as: "home"
  post '/signup', to: 'users#create', as: "users"
  post '/login', to: 'users#attempt_login', as: "attempt_login"
  delete '/logout', to: 'users#logout', as: 'logout'

  post '/itineraries/:itinerary_id/activities/:activity_id/users/:user_id', to: 'users#add_activity', as: 'new_itinerary_activity_user'
  delete '/itineraries/:itinerary_id/activities/:activity_id/users/:user_id', to: 'users#remove_activity', as: 'remove_itinerary_activity_user'
  post '/itineraries/:itinerary_id/users/:user_id', to: 'users#add_itinerary', as: 'new_itinerary_user'
  delete '/itineraries/:itinerary_id/users/:user_id', to: 'users#remove_itinerary', as: 'remove_itinerary_user'

  post '/itineraries/:some_itinerary/activities/:activity_id/reviews' => 'reviews#create_review', as: 'itinerary_activity_reviews'


  resources :itineraries do
    post '/reviews' => 'reviews#create_review', as: 'reviews'
    resources :activities
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
>>>>>>> b21dc279287edd7f36366157c30b27b324b9a302
end
