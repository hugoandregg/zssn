Rails.application.routes.draw do
  resources :survivors, only: [:index, :create] do
  	resource :location, only: [:update]
  end
end
