Rails.application.routes.draw do
  root "owners#index"
  resources :owners do
    resources :portfolios do
      resources :assets
    end
  end
end
