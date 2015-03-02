Rails.application.routes.draw do
  devise_for :users

  match 'home', to: 'homes#show', via: [:get]

  namespace 'webhooks' do
    resources :dropbox, only: [:index, :create]
  end
end
