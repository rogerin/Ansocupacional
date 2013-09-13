class PageController < ApplicationController
  def index
  	if session[:user]
      if session[:user_tipo]  == 1
        @usuarios = User.count
        @empresas = Empresa.count
        @funcionarios = Funcionario.count
        @exames = Consulta.count
      elsif session[:user_tipo] == 2
        @empresas = Empresa.where(user_id: session[:user_id]).count
      else
      end
  	end

    if session[:empresa_id]
      @funcionarios = Funcionario.where(:empresa_id => session[:empresa_id]).count
      @exames = Consulta.where(:empresa_id => session[:empresa_id]).count 
    end

    @categorias = Categoria.count
  end

  def login
  end
end
