Rails.application.routes.draw do
  root 'mind_cards#index'
  resources :mind_cards
end
