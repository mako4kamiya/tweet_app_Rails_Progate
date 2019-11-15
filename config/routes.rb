Rails.application.routes.draw do
  get 'posts/:id/edit' => 'posts#edit'
  get 'posts/new' => 'posts#new'
  get 'posts/index' => 'posts#index'
  get 'posts/:id' => 'posts#show'
  post 'posts/create' => 'posts#create'
  post 'posts/:id/update' => 'posts#update'

  get '/' => 'home#top'
  get '/about' => 'home#about'
end
