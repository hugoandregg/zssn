Rails.application.routes.draw do
  resources :survivors, only: [:index, :create] do
  	resource :location, only: [:update]
  	resource :contamination_reports, only: [:create]
  end

  resource :trade, only: [:create] 
end
