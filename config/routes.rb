Rails.application.routes.draw do
  root "application#index"
  get 'allCountries' => 'countries#index', as: 'allCountries'
  get 'search', to: "cards/camp_sites#search"

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

  namespace :cards do
    resources :camp_sites, only: [:index]
    resources :countries, only: [] do
      resources :camp_sites, only: [:index]
      resources :regions, only: [] do
        resources :camp_sites, only: [:index]
        resources :cities, only: [] do
          resources :camp_sites, only: [:index]
        end
      end
    end
  end




end
