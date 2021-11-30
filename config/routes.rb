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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
