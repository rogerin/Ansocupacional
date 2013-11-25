class SessionsController < ApplicationController
	def new
		@session = Session.new

		respond_to do |format|
	      format.html { render layout: false}
	      format.json { render json: @funcionario, layout: false }
	    end
	end

	def create
		if params[:session][:login] == "" or params[:session][:password] == ""
			redirect_to new_sessions_path, :notice => "Preencha os dados corretamente."
		else

			@session = Session.new(params[:session])
			if @session.valid?
				@user = User.where(login: @session.login, password_digest: @session.password)
				if @user
					if @user[0].status == 1
						session[:user_id]	= @user[0].id
						session[:user_nome] = @user[0].nome
						session[:user_tipo] = @user[0].tipo
						session[:user_link] = @user[0].avatar.url(:thumb)
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
						if @empresa.status == 1
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
						elsif @empresa.status == 0
							LogEmpresa.create(:empresa_id => @empresa.id, :mensagem => "[Login] Empresa #{@empresa.nome} tentou login, mas sua conta esta desabilitada");
							redirect_to new_sessions_path, :notice => "Sua conta foi desabilitada, procure um administrador."
						else
							redirect_to new_sessions_path, :notice => "Falha no sistema, procure um administrador."						
						end
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
