# get '/users', to: 'users#index'
resources :users, :only => [:show, :edit, :update, :delete]
get '/users', to: 'users#index', :as => :users
# get '/users/:id', to: 'users#show', :as => :user
# delete '/users/:id', to: 'users#destroy'
match '/users/:id/finish_signup', to: 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
