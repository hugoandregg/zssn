Rails.application.routes.draw do
  resources :survivors, only: [:index, :create]
end
