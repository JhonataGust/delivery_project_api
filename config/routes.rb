Rails.application.routes.draw do
  namespace :v1 do
    post '/users', to: 'users#create'
    post '/users/login', to: 'users#login'

    get '/cities', to:'cities#index'

    namespace :users do
      get '/', to:'users#index'
      get '/profile', to: 'users#profile'
      put '/', to: 'users#update'

      namespace :addresses do
        post '/', to: 'addresses#create'
      end

      get '/clients', to:'clients#index'
      post '/clients', to:'clients#create'
      get '/clients/:id', to:'clients#show'
      put '/clients/:id', to:'clients#update'
    end
  end
end
