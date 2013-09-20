class PageController < ApplicationController
  def index
    scope = LogEmpresa
    scopeAsset = Asset

    if session[:user]
      if session[:user_tipo]  == 1
        
        @usuarios = User.count
        @empresas = Empresa.count
        @funcionarios = Funcionario.count
        @exames = Consulta.count
      

      elsif session[:user_tipo] == 2      
        
        @emp = Empresa.where(:user_id => session[:user_id])
        @empresas = @emp.count
        @exames = Consulta.where(:empresa_id => @emp).count
        @funcionarios = Funcionario.where(:empresa_id => @emp).count
        scope = scope.where(:empresa_id => @emp)

        @cons = Consulta.where(:empresa_id => @emp)
        scopeAsset = scopeAsset.where(["assets.consulta_id = ? ", @cons])
      else
        # NADA
      end
  	end

    if session[:empresa_id]
      @funcionarios = Funcionario.where(:empresa_id => session[:empresa_id]).count
      @exames = Consulta.where(:empresa_id => session[:empresa_id]).count 
      scope = scope.where(:empresa_id => session[:empresa_id])

      @cons = Consulta.where(:empresa_id => session[:empresa_id])
      scopeAsset = scopeAsset.where(["assets.consulta_id = ? ", @cons])

    end

    @por_categoria = Asset.select("COUNT(assets.categoria_id) as total, assets.categoria_id").group("assets.categoria_id")
    @acessos = scope.includes(:empresa).order("log_empresas.created_at DESC").limit(20)
    @categorias = Categoria.count
  end

  def login
  end
end
