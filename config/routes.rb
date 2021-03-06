Rails.application.routes.draw do

  resources :matches
  resources :teams

  get 'team/new'

  get 'team/create'

  resources :users

  controller :sessions do
      get 'login' => :new
      post 'login' => :create
      delete 'logout' => :destroy
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

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
  post 'choose_team', to: 'matches#choose_team', as: 'choose_team'
  post 'select_team', to: 'matches#select_team', as: 'select_team'
  get 'seleziona_team', to: 'matches#seleziona_team', as: 'seleziona_team'
  post 'select_team2', to: 'matches#select_team2', as: 'select_team2'
  post 'show_match', to: 'matches#show_match', as: 'show_match'
  post 'elimina_match', to: 'matches#elimina_match', as: 'elimina_match'
  post 'send_request', to: 'teams#send_request', as: 'send_request'
  post 'leave_team', to: 'teams#leave_team', as: 'leave_team'
  post 'refuse_member', to: 'teams#refuse_member', as: 'refuse_member'
  post 'remove_member', to: 'teams#remove_member', as: 'remove_member'
  post 'accept_member', to: 'teams#accept_member', as: 'accept_member'
  post 'form2', to: 'teams#form2', as: 'form2'

  post 'new_event', to: 'matches#new_event', as: 'new_event'

  post 'searchtm', to: 'users#searchtm', as: 'searchtm'
  get 'search', to: 'users#search', as: 'search'
end
