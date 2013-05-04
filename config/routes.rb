Deets::Application.routes.draw do
  get 'deets/:id' => 'deets#show'
end
