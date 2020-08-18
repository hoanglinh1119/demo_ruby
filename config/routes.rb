Rails.application.routes.draw do
  get 'home/index', to: 'home#index', as: :home
  get '/get_info', to: 'test#get_info', as: :index
  post '/get_info', to: 'test#sign_up', as: :sign_up
  get '/sign_in', to: 'test#sign_in', as: :sign_in
  post '/sign_in', to: 'test#post_sign_in', as: :post_sign_in
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
