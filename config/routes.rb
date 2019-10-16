Rails.application.routes.draw do
  post 'events/', to: 'events#create'
  get 'events/:id', to: 'events#show'
  get 'events/', to: 'events#index'

  post 'payments/', to: 'payments#create'
  get 'payments/:id', to: 'payments#show'
  get 'payments/', to: 'payments#index'
end
