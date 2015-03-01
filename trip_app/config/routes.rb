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

  post '/itineraries/:itinerary_id/activities/:activity_id/users', to: 'users#create_activity', as: 'create_activity_companions'
  delete '/itineraries/:itinerary_id/activities/:activity_id/users', to: 'users#index_activity', as: 'delete_activity_companions'

  post '/itineraries/:some_itinerary/activities/:activity_id/reviews' => 'reviews#create_review', as: 'itinerary_activity_reviews'

  resources :itineraries do
    post '/reviews' => 'reviews#create_review', as: 'reviews'
    resources :activities
    resources :companions
  end

#         root GET    /                                                                                users#login
#                         test_form GET    /test(.:format)                                                                  mandrill#test_form
#                              test POST   /test(.:format)                                                                  mandrill#test
#                             login GET    /login(.:format)                                                                 users#login
#                            signup GET    /signup(.:format)                                                                users#signup
#                              home GET    /home(.:format)                                                                  users#home
#                             users POST   /signup(.:format)                                                                users#create
#                     attempt_login POST   /login(.:format)                                                                 users#attempt_login
#                            logout DELETE /logout(.:format)                                                                users#logout
#                 itinerary_reviews POST   /itineraries/:itinerary_id/reviews(.:format)                                     reviews#create
#     itinerary_activity_companions GET    /itineraries/:itinerary_id/activities/:activity_id/companions(.:format)          companions#index
#                                   POST   /itineraries/:itinerary_id/activities/:activity_id/companions(.:format)          companions#create
#  new_itinerary_activity_companion GET    /itineraries/:itinerary_id/activities/:activity_id/companions/new(.:format)      companions#new
# edit_itinerary_activity_companion GET    /itineraries/:itinerary_id/activities/:activity_id/companions/:id/edit(.:format) companions#edit
#      itinerary_activity_companion GET    /itineraries/:itinerary_id/activities/:activity_id/companions/:id(.:format)      companions#show
#                                   PATCH  /itineraries/:itinerary_id/activities/:activity_id/companions/:id(.:format)      companions#update
#                                   PUT    /itineraries/:itinerary_id/activities/:activity_id/companions/:id(.:format)      companions#update
#                                   DELETE /itineraries/:itinerary_id/activities/:activity_id/companions/:id(.:format)      companions#destroy
#              itinerary_activities GET    /itineraries/:itinerary_id/activities(.:format)                                  activities#index
#                                   POST   /itineraries/:itinerary_id/activities(.:format)                                  activities#create
#            new_itinerary_activity GET    /itineraries/:itinerary_id/activities/new(.:format)                              activities#new
#           edit_itinerary_activity GET    /itineraries/:itinerary_id/activities/:id/edit(.:format)                         activities#edit
#                itinerary_activity GET    /itineraries/:itinerary_id/activities/:id(.:format)                              activities#show
#                                   PATCH  /itineraries/:itinerary_id/activities/:id(.:format)                              activities#update
#                                   PUT    /itineraries/:itinerary_id/activities/:id(.:format)                              activities#update
#                                   DELETE /itineraries/:itinerary_id/activities/:id(.:format)                              activities#destroy
#              itinerary_companions GET    /itineraries/:itinerary_id/companions(.:format)                                  companions#index
#                                   POST   /itineraries/:itinerary_id/companions(.:format)                                  companions#create
#           new_itinerary_companion GET    /itineraries/:itinerary_id/companions/new(.:format)                              companions#new
#          edit_itinerary_companion GET    /itineraries/:itinerary_id/companions/:id/edit(.:format)                         companions#edit
#               itinerary_companion GET    /itineraries/:itinerary_id/companions/:id(.:format)                              companions#show
#                                   PATCH  /itineraries/:itinerary_id/companions/:id(.:format)                              companions#update
#                                   PUT    /itineraries/:itinerary_id/companions/:id(.:format)                              companions#update
#                                   DELETE /itineraries/:itinerary_id/companions/:id(.:format)                              companions#destroy
#                       itineraries GET    /itineraries(.:format)                                                           itineraries#index
#                                   POST   /itineraries(.:format)                                                           itineraries#create
#                     new_itinerary GET    /itineraries/new(.:format)                                                       itineraries#new
#                    edit_itinerary GET    /itineraries/:id/edit(.:format)                                                  itineraries#edit
#                         itinerary GET    /itineraries/:id(.:format)                                                       itineraries#show
#                                   PATCH  /itineraries/:id(.:format)                                                       itineraries#update
#                                   PUT    /itineraries/:id(.:format)                                                       itineraries#update
#                                   DELETE /itineraries/:id(.:format)                                                       itineraries#destroy
# 


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
end
