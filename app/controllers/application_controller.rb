class ApplicationController < ActionController::Base
  protect_from_forgery
	before_filter :need_login, unless: -> {
		controller_name == 'sessions'

	}

  protected
  def need_login
  	unless esta_logado?
  		session[:requested_url] = request.url
  		redirect_to new_sessions_path
  	end
  end

  def esta_logado?
  	!session[:logado].nil?
  end


end
