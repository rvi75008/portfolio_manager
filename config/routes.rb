Rails.application.routes.draw do
  root "owners#index"
  resources :owners do
    resources :portfolios
  end
end
