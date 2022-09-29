Rails.application.routes.draw do
  namespace :v1 do
    post '/users', to: 'users#create'
    post '/users/login', to: 'users#login'

    get '/cities', to:'cities#index'

    namespace :users do
      get '/', to:'users#index'
    end
  end
end