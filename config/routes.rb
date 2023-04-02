Rails.application.routes.draw do
  namespace :api do
    resources :echoes, only: [:index]
    resources :venues, only: [:index]
  end
end
