Rails.application.routes.draw do
  post 'events/', to: 'events#create'
  get 'events/:id', to: 'events#show'
  get 'events/', to: 'events#index'
  patch 'events/:id', to: 'events#update_number_of_tickets'
end
