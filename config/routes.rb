Rails.application.routes.draw do
  devise_for :users

  match 'home', to: 'homes#show', via: [:get]

  namespace 'webhooks' do
    resources :dropbox, only: [:index, :create]
  end
  get '/auth/:provider/callback', to: 'authorizations#create'
  get '/auth/failure' do
    flash[:notice] = params[:message]
    redirect '/'
  end
end
