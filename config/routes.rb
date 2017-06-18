Rails.application.routes.draw do
  resources :orders
  post 'create_review', to: 'food_items#create_review', as: 'create_review'
  post 'add_to_cart/:id', to: 'home#add_to_cart', as: 'add_to_cart'
  get 'create_order/:id', to: 'home#create_order', as: 'create_order'
  get 'food_items/:id', to: 'food_items#show', as: 'food_item'
  get 'thank_you', to: 'home#thank_you'
  root 'home#menu'
  get 'contact', to: 'home#contact'
  get 'section/:id', to: 'sections#show', as: 'section'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
