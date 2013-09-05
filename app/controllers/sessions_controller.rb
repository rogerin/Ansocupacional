class SessionsController < ApplicationController
	def new
		@session = Session.new
		render layout: false
	end

	def create
		if params[:session][:login] == "" or params[:session][:password] == ""
			redirect_to new_sessions_path, :notice => "Preencha os dados corretamente."
		else

			@session = Session.new(params[:session])
			if @session.valid?
				@user = User.login(@session.login, @session.password)
				if @user
					session[:user_id]	= @user.id
					session[:user_nome] = @user.nome
					session[:user_tipo] = @user.tipo
					session[:user]		= true
					session[:logado]	= true
					redirect_to session[:requested_url] || root_path

				else
					@empresa = Empresa.login(@session.login, @session.password)
					if @empresa
						session[:empresa_id]	= @empresa.id
						session[:empresa_nome]	= @empresa.nome
						session[:empresa_email]	= @empresa.email
						session[:empresa_cnpj]	= @empresa.cnpj
						session[:user]			= false
						session[:logado]		= true
						redirect_to session[:requested_url] || root_path
					else
						redirect_to new_sessions_path, :notice => "Falha no login"
					end
				end
			else
				render :new
			end
		end
	end


	def destroy
		session[:user_id] = nil
		session[:user_nome] = nil
		session[:user_tipo] = nil
		redirect_to new_sessions_path
	end

	def logout
		session[:user_id] = nil
		session[:user_nome] = nil
		session[:user_tipo] = nil
		redirect_to new_sessions_path
	end


end
