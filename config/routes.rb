Rails.application.routes.draw do
  get 'food_items/:id', to: 'food_items#show', as: 'food_item'

  get 'sections/show'

  root 'home#menu'

  get 'contact', to: 'home#contact'

  get 'section/:id', to: 'sections#show', as: 'section'

  get 'home/menu'

  get 'home/contact'

  get 'home/section'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
