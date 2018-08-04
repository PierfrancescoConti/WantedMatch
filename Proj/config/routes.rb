Rails.application.routes.draw do



  resources :teams
  get 'team/new'

  get 'team/create'

  resources :users
  controller :sessions do
      get 'login' => :new
      post 'login' => :create
      delete 'logout' => :destroy
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#homepage'
  get '', to: 'home#homepage', as: 'home'

  get 'help', to: 'home#help', as: 'help'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/profile', to: 'users#profile', as: 'profile'
  post 'add_team', to: 'users#add_team', as: 'add_team'
  post 'remove_team1', to: 'users#remove_team1', as: 'remove_team1'
  post 'remove_team2', to: 'users#remove_team2', as: 'remove_team2'
  post 'elimina_team', to: 'teams#elimina_team', as: 'elimina_team'


  post 'search', to: 'users#search', as: 'search'
end
