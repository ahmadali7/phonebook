Rails.application.routes.draw do
  resources :phones do
    collection do
      get 'export'
      post 'uploads'
    end
  end
  root 'phones#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
