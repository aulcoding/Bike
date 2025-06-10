Rails.application.routes.draw do
  # Health check route (keep it if you need it)
  get "up" => "rails/health#show", as: :rails_health_check

  post '/race_results', to: 'race_results#create'
  post '/race_results/reload', to: 'race_results#reload'  # Use POST for reloading
  get '/race_results', to: 'race_results#index'  # Route for viewing results
end
