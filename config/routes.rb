Rails.application.routes.draw do
  resources :real_estate_ads
  devise_for :users
  resources :ereal_estate_adds
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
