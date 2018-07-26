Rails.application.routes.draw do



  get 'friend/new'

  get 'friend/create'

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
  post 'add_friend', to: 'users#add_friend', as: 'add_friend'
  post 'remove_friend1', to: 'users#remove_friend1', as: 'remove_friend1'
  post 'remove_friend2', to: 'users#remove_friend2', as: 'remove_friend2'


  post 'search', to: 'users#search', as: 'search'
end
