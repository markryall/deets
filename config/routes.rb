Deets::Application.routes.draw do
  get 'deets/:id' => 'deets#show'
  post 'personacallback' => 'home#persona_callback'
  get 'oauth2callback' => 'home#google_oauth_callback'
  get 'profile' => 'profile#edit'
  put 'profile' => 'profile#update'
  post 'remove_link' => 'profile#remove_link'
  post 'add_link' => 'profile#add_link'
  get 'logout' => 'home#logout', as: 'logout'
  root to: 'home#index'
end
