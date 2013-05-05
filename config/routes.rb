Deets::Application.routes.draw do
  get 'deets/:id' => 'deets#show'
  post 'personacallback' => 'home#persona_callback'
  get 'oauth2callback' => 'home#google_oauth_callback'
  get 'profile' => 'profile#edit'
  put 'profile' => 'profile#update'
  get 'logout' => 'home#logout', as: 'logout'
  root to: 'home#index'
end
