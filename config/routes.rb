Rails.application.routes.draw do
 
  root 'products#index'

  get '/ranks/grads'
  get '/ranks/index' 
  get '/ranks/sales'
  get '/ranks/votes'
  
  resources :products do
    resources :reviews 
  end
     
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
