class PageController < ApplicationController
  def index

    scope = LogEmpresa

    #@test = Asset.count(:group => "categoria_id")
   
  	if session[:user]
      if session[:user_tipo]  == 1
        @usuarios = User.count
        @empresas = Empresa.count
        @funcionarios = Funcionario.count
        @exames = Consulta.count

        #scope = scope.where(:consulta_id => @consultas)
     

      elsif session[:user_tipo] == 2
        
        @emp = Empresa.where(:user_id => session[:user_id])
        @empresas = @emp.count
        @exames = Consulta.where(:empresa_id => @emp).count
        @funcionarios = Funcionario.where(:empresa_id => @emp).count
        scope = scope.where(:empresa_id => @emp)
      
      else
      
      end

  	end

    if session[:empresa_id]
      
      @funcionarios = Funcionario.where(:empresa_id => session[:empresa_id]).count
      @exames = Consulta.where(:empresa_id => session[:empresa_id]).count 

      scope = scope.where(:empresa_id => session[:empresa_id])
    
    end

    @acessos = scope.order("created_at DESC").limit(20)
    @categorias = Categoria.count
  end

  def login

  end
end
