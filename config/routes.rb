Rails.application.routes.draw do
  root 'cards#index', as: 'home'
  get 'allCountries' => 'countries#index', as: 'allCountries'

  resources :countries

end
