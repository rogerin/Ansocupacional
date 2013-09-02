class PageController < ApplicationController
  def index
  	if session[:user]
      if session[:user_tipo]  == 1
        @usuarios = User.count
        @empresas = Empresa.count
        @funcionarios = Funcionario.count
        @exames = Exame.count
      else
        @empresas = Empresa.where(user_id: session[:user_id]).count
      end
  		@usuarios = User.count
	  	@empresas = Empresa.count
	  	@funcionarios = Funcionario.count
	  	@exames = Exame.count
	  	@categorias = Categoria.count
  	else
	  	@funcionarios = Funcionario.where(:empresa_id => session[:empresa_id]).count
	  	@exames = Exame.count
	  	@categorias = Categoria.count
  	end
  end

  def login
  end
end
