Rails.application.routes.draw do
  devise_for :users

  match 'home', to: 'homes#show', via: [:get]
end
