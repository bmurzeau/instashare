class Webhooks::DropboxController < ApplicationController

  def index
    render plain: "#{params[:challenge]}" if params[:challenge].present?
  end
end
