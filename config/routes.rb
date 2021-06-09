Rails.application.routes.draw do
  root "application#index"
  get 'allCountries' => 'countries#index', as: 'allCountries'

  scope :admin do

    resources :countries do
      resources :regions
      resources :camp_sites
    end

    resources :regions do
      resources :cities
      resources :camp_sites
    end

    resources :cities do
      resources :camp_sites
    end

    resources :camp_sites

  end

end
