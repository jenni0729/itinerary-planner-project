Rails.application.routes.draw do


  root 'users#signup'

  get 'itineraries/:id/invite', to: 'mandrill#invite_form', as: "invite_form"
  get 'itineraries/:id/invite/signup', to: 'users#join', as: "invite_signup"

  get '/test', to: 'mandrill#test_form', as: "test_form"
  post '/test', to: 'mandrill#test', as: "test"
  post '/emails', to: 'mandrill#email', as: "email"
  post 'itineraries/:id/invite', to: 'mandrill#test', as: "invite"
  post 'itineraries/:id/invite/signup', to: 'users#create', as: "invited_user_signup"

  get '/login', to: 'users#login', as: "login"
  get '/signup', to: 'users#signup', as: "signup"
  get '/home', to: 'users#home', as: "home"
  post '/signup', to: 'users#create', as: "users"
  post '/login', to: 'users#attempt_login', as: "attempt_login"
  delete '/logout', to: 'users#logout', as: 'logout'

  post '/itineraries/:itinerary_id/activities/:activity_id/users', to: 'users#add_activity', as: 'new_itinerary_activity_user'
  delete '/itineraries/:itinerary_id/activities/:activity_id/users/:user_id', to: 'users#remove_activity', as: 'remove_itinerary_activity_user'
  post '/itineraries/:itinerary_id/users', to: 'users#add_itinerary', as: 'new_itinerary_user'
  delete '/itineraries/:itinerary_id/users/:user_id', to: 'users#remove_itinerary', as: 'remove_itinerary_user'

  post '/itineraries/:some_itinerary/activities/:activity_id/reviews' => 'reviews#create_review', as: 'itinerary_activity_reviews'

  resources :itineraries do
    post '/reviews' => 'reviews#create_review', as: 'reviews'
    resources :activities
  end

end