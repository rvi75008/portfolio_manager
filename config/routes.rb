Rails.application.routes.draw do
  devise_for :users
  scope '/admin' do
    resources :users
  end
  resources :roles
  resources :users
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
