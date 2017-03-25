Rails.application.routes.draw do
  resources :rooms
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # user operation
  get "users/whoami"
  post "users/login"
  delete "users/logout"
  post "users/register"

  #lobby operation
  get "lobby/join/:id", to: 'lobby#join'
  get "lobby/exit"
  get "lobby/ready"
  get "lobby/unready"
  get "lobby/check_allready"

end
