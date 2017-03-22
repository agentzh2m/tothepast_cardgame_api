Rails.application.routes.draw do
  resources :rooms
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "users/whoami"
  post "users/login"
  delete "users/logout"
  post "users/register"
end
