Rails.application.routes.draw do
  get '/products' => 'employees#index'
  get '/products/new' => 'employees#new'
  post '/products' => 'employees#create'
  get '/products/:id' => 'employees#show'
  get '/products/:id/delete' => 'employees#destroy'
end
