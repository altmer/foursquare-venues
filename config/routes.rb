Rails.application.routes.draw do
  namespace :api do
    resources :echoes, only: [:index]
  end
end
