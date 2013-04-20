RailsNaPraiaDuvidas::Application.routes.draw do
  resources :answers


  resources :questions


  get "home/index"

  resources :badges
 
  root :to => 'home#index'

end
