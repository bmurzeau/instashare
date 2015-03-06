class AuthorizationsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    if current_user.authorizations.where(provider: auth.provider).empty?
      @auth = Authorization.new(
        user: current_user,
        uid: auth.uid,
        provider: auth.provider,
        token: auth.credentials.token,
        secret: auth.credentials.secret,
        name: auth.extra.raw_info.person.display_name,
        link: auth.extra.raw_info.person.profileurl
      )
    end
    @auth.save
    redirect_to home_url
  end
end
