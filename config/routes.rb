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
      namespace :clients do
      get '/', to:'clients#index'
      post '/', to:'clients#create'
      get '/:id', to:'clients#show'
      put '/:id', to:'clients#update'

      get ':uid/products', to: 'products#index'
      post '/products', to: 'products#create'
      put '/products/:product_id', to: 'products#update'
      get 'products/:product_id', to:  'products#show'

      get '/extras', to: 'extras#index'
      post '/extras', to: 'extras#create'
      end
    end
  end
end
