Rails.application.routes.draw do
  resources :survivors, only: [:index, :create] do
  	resource :location, only: [:update]
  	resource :contamination_reports, only: [:create]
  end

  resource :trade, only: [:create]

  scope "/reports" do
    get "/infected", to: "reports#infected"
    get "/non-infected", to: "reports#non_infected"
    get "/average", to: "reports#average_items_per_survivor"
    get "/lost-points", to: "reports#lost_points"
  end  
end
