Rails.application.routes.draw do
  root "owners#index"
  resources :owners do
    resources :portfolios do
      resources :assets do
        resources :transactions
      end
    end
  end
  resources :currencies
end
