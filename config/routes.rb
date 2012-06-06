Calltracker::Application.routes.draw do

  resources :calls

  resources :groups

  resources :call_locations

  resources :contact_types

  resources :contacts

  resources :call_types

  resources :user_locations

  devise_for :users
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  resources :users, :controller => "users"

  root :to => "calls#index"

  match "/dashboard" => "calls#index"

  get "users/signup" => "home#index"
  get "searches/results" => "searches#results", :as => "searches"
  get "/search" => "searches#index", :as => "search"

  post "searches/patient" => "searches#patient", :as => "patientsearch"
  post "searches/type" => "searches#type", :as => "typesearch"
  post "searches/rep" => "searches#rep", :as => "repsearch"
  post "searches/date" => "searches#date", :as => "datesearch"

end
