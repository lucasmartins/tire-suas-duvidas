RailsNaPraiaDuvidas::Application.routes.draw do
  resources :answers
  resources :questions
  resources :badges

  get "home/index"
  match 'users/:user_id', to: 'users#index'

  match 'login', to: 'home#login'
  match 'login/:provider', to: 'sessions#login'
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  root :to => 'home#index'

end
