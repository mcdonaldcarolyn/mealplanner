Rails.application.routes.draw do
  
  
  devise_for :users
  get '/auth/facebook/callback' => 'sessions#create'
  resources :meals, except: :show do 
    resources :ingredients, only: [:index, :destroy]
  end
  resources :ingredients
  
  resources :meals_ingredients
  
  root to: "meals#index"

  # add in later
  # resources  :week_plan, only: :index 
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
