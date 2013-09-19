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
					if @user.status == 1
						session[:user_id]	= @user.id
						session[:user_nome] = @user.nome
						session[:user_tipo] = @user.tipo
						session[:user_link] = @user.avatar.url(:thumb)
						session[:user]		= true
						session[:logado]	= true
						redirect_to session[:requested_url] || root_path
					elsif @user.status == 0
						redirect_to new_sessions_path, :notice => "Sua conta foi desabilitada, procure um administrador."
					else
						redirect_to new_sessions_path, :notice => "Falha no sistema, procure um administrador."						
					end

				else
					@empresa = Empresa.login(@session.login, @session.password)
					if @empresa
						@link = User.where(id: @empresa.user_id).first
						LogEmpresa.create(:empresa_id => @empresa.id, :mensagem => "[Login] Empresa #{@empresa.nome} fez login");
						session[:empresa_id]	= @empresa.id
						session[:empresa_nome]	= @empresa.nome
						session[:empresa_email]	= @empresa.email
						session[:empresa_cnpj]	= @empresa.cnpj
						session[:user_link] = @link.avatar.url(:thumb)
						session[:user]			= false
						session[:logado]		= true
						redirect_to session[:requested_url] || "exames#index"
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
		session[:user_id]		= nil
		session[:user_nome]		= nil
		session[:user_tipo]		= nil
		session[:user_link]		= nil
		session[:user]			= nil
		session[:logado]		= nil
		session[:empresa_id]	= nil
		session[:empresa_nome]	= nil
		session[:empresa_email]	= nil
		session[:empresa_cnpj]	= nil
		session[:user_link]		= nil
		session[:user]			= nil
		session[:logado]		= nil
		redirect_to new_sessions_path
	end

	def logout
		if session[:empresa_id]
			LogEmpresa.create(:empresa_id => session[:empresa_id], :mensagem => "[Logout] Empresa #{session[:empresa_nome]} fez login");
		end
		session[:user_id]		= nil
		session[:user_nome]		= nil
		session[:user_tipo]		= nil
		session[:user_link]		= nil
		session[:user]			= nil
		session[:logado]		= nil
		session[:empresa_id]	= nil
		session[:empresa_nome]	= nil
		session[:empresa_email]	= nil
		session[:empresa_cnpj]	= nil
		session[:user_link]		= nil
		session[:user]			= nil
		session[:logado]		= nil
		redirect_to new_sessions_path
	end


end
