Rails.application.routes.draw do
  root 'kittens#index'

  get '/kittens' => 'kittens#index'

  get '/kittens/index' => 'kittens#index'

  get '/kitten/new' => 'kittens#new'

  get '/kitten/:id/show' => 'kittens#show'

  get '/kitten/:id/edit' => 'kittens#edit'

  put '/kitten/:id' => 'kittens#update'

  post '/kitten' => 'kittens#create'

  delete '/kitten/:id' => 'kittens#destroy'

end
