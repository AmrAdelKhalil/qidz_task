Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dashboards#index'
  resources :movies, only: [] do
    collection do
      get :search
    end
  end
end
