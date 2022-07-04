Rails.application.routes.draw do
  root 'mind_cards#index'
  resources :packs
  resources :mind_cards
end
