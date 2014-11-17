Rails.application.routes.draw do
  resources :houses, only: [:create] do
    collection do
      get 'near'
    end
  end

  root to: 'homepage#show'
end
