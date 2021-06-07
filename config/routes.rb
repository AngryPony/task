Rails.application.routes.draw do
  root 'cards#index', as: 'home'
  get 'allCountries' => 'countries#index', as: 'allCountries'

  scope :admin do
    resources :countries do
      resources :regions
    end
    resources :regions
  end


end
