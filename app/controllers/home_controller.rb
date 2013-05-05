require 'persona'
require 'google_oauth'

class HomeController < ApplicationController
  include Persona
  include GoogleOauth

  skip_filter :require_login

  def index
    if logged_in?
      redirect_url = session[:initial_url] || :profile
      session[:initial_url] = nil
      redirect_to redirect_url
    else
      @google_login = google_oauth_url
      render layout: 'landing'
    end
  end

  def persona_callback
    response = {}
    verify_persona { |email, response| session[:email] = email }
    render json: response
  end

  def google_oauth_callback
    verify_google_oauth { |email| session[:email] = email }
    redirect_to '/'
  end
end
