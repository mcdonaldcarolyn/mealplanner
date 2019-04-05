Rails.application.routes.draw do
  
  
  devise_for :users
  resources :meals do 
    resources :ingredients, only: :index
  end
  resources  :week_plan, only: :index
  resources :meals_ingredients
  
  root to: "meals#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
