Rails.application.routes.draw do
  resources :users

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  get 'welcome', to: 'sessions#welcome'

  get 'authorized', to: 'sessions#page_requires_login'

  delete 'logout', to: 'sessions#destroy'

  get 'pdf', to: 'sessions#pdf'
  resources :pasiens

  root to: 'sessions#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
