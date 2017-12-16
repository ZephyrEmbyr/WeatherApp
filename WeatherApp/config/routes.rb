Rails.application.routes.draw do
  root "weather_app#index"
  #get 'weather_app/index'
  get "weather_app" => "weather_app#index"
  get "/" => "weather_app#index"
  post "/" => "weather_app#enterZip"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
