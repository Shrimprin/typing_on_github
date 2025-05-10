Rails.application.routes.draw do
  namespace :api do
    resources :repositories, only: [:index, :create]
  end
end
