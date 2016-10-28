Rails.application.routes.draw do
  get '/' => 'star_wars#index'
  
  namespace :api do
    namespace :v1 do
      get '/star_wars' => 'star_wars#index'
      post 'star_wars' => 'star_wars#create'
      get 'star_wars/:id' => 'star_wars#show'
      patch 'star_wars/:id' => 'star_wars#update'
      delete 'star_wars/:id' => 'star_wars#destroy'
    end
    namespace :v2 do
      get 'star_wars' => 'star_wars#index'
      post 'star_wars' => 'star_wars#create'
      get 'star_wars/:id' => 'star_wars#show'
      patch 'star_wars/:id' => 'star_wars#update'
      delete 'star_wars/:id' => 'star_wars#destroy'
    end
  end
end
