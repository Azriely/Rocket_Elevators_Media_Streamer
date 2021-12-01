Rails.application.routes.draw do
  resources :interventions
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
 

get "home/login"
get "/" => "home#index", :as => "root"
post "/" , to: "home#create"
get "residential" => "home#residential"
get "commercial" => "home#commercial"
get "quote" => "home#quote"
get "/intervention" => "home#intervention"
post "getData" => "quote#getData"
get 'building_select/:customerID', to: 'intervention#building_select'
get 'battery_select/:buildingID', to: 'intervention#battery_select'
get 'column_select/:batteryID', to: 'intervention#column_select'
get 'elevator_select/:columnID', to: 'intervention#elevator_select'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
