class ConsultasController < ApplicationController
  # GET /consultas
  # GET /consultas.json
  def index
    if params[:categoria]
      @exames = Exame.order('nome').where(categoria_id: params[:categoria][:categoria_id])
    else
      @exames = []
    end
    

    if params[:empresa]
      @exames = Exame.where(empresa_id: params[:empresa][:empresa_id])
    else
      @exames = []
    end
  

    if session[:empresa_id]
      @funcionarios = Funcionario.order('nome').where(empresa_id: session[:empresa_id])
      @empresas = Empresa.order('nome').where(id: session[:empresa_id])
      @empresa = true
    else
      if session[:user]
        if session[:user_tipo] == 1
          @empresas = Empresa.order('nome').all    
        else
          @empresas = Empresa.order('nome').where(user_id: session[:user_id])  
        end
      end
    end

    @categorias = Categoria.order('nome').all
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exames }
    end
  end



  def busca
    
    scope = Asset

    if session[:user]
      @empresa = false
      if session[:user_tipo] == 1
        @empresas = Empresa.all
      elsif session[:user_tipo] == 2
        @empresas = Empresa.where(:user_id => session[:user_id])
        @consultas = Consulta.find(:all, :conditions => ['empresa_id = ?', @empresas])
        scope = scope.where(:consulta_id => @consultas)
      end
    else
      @empresa = true
      @empresas   = Empresa.where(:id => session[:empresa_id] )
      @consultas = Consulta.find(:all, :conditions => ['empresa_id = ?', @empresas])
      scope = scope.where(:consulta_id => @consultas)
    end

    if (params[:busca][:nome].present?)
      @funcionarios = Funcionario.find(:all, :conditions => ['nome LIKE ? or rg LIKE ? or matricula LIKE ?', "%#{params[:busca][:nome]}%","%#{params[:busca][:nome]}%","%#{params[:busca][:nome]}%"])
      @consultas = Consulta.where(:funcionario_id => @funcionarios)
      scope = scope.where(:consulta_id => @consultas)
    end

    if (params[:busca][:categoria_id].present?)
      scope = scope.where(:categoria_id => params[:busca][:categoria_id])
    end
    if (params[:busca][:data_inicio].present? and params[:busca][:data_fim].present? )
      scope = scope.where(:data => params[:busca][:data_inicio].to_time.strftime("%Y-%m-%d")..params[:busca][:data_fim].to_time.strftime("%Y-%m-%d"))
    end
    if (params[:busca][:empresa_id].present?)
      @consultas = Consulta.find(:all, :conditions => ['empresa_id = ?', params[:busca][:empresa_id]])
      scope = scope.where(:consulta_id => @consultas)
    end


    @arquivos = scope.includes(consulta: [:funcionario, :empresa]).all
    @categorias = Categoria.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exames }
    end
  end

  # GET /consultas/1
  # GET /consultas/1.json
  def show
    @consulta = Consulta.find(params[:id])
    @consulta.assets.build

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @consulta }
    end
  end

  # GET /consultas/new
  # GET /consultas/new.json
  def new

    @consulta = Consulta.new
    5.times { @consulta.assets.build }

    if session[:empresa_id]
      @funcionarios = Funcionario.order('nome').where(empresa_id: session[:empresa_id])
      @empresas = Empresa.order('nome').where(id: session[:empresa_id])
    else
      @funcionarios = []
      if session[:user]
        if session[:user_tipo] == 1
          @empresas = Empresa.order('nome').all    
        else
          @empresas = Empresa.order('nome').where(user_id: session[:user_id])  
        end
      end
      
    end

     @categorias = Categoria.all


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @consulta }
    end
  end

  # GET /consultas/1/edit
  def edit
    @consulta = Consulta.find(params[:id])
    5.times { @consulta.assets.build }

  end

  # POST /consultas
  # POST /consultas.json
  def create
    @consulta = Consulta.new(params[:consulta])

    respond_to do |format|
      if @consulta.save
        format.html { redirect_to @consulta, flash: { success: 'Exame enviado com sucesso.' } }
        format.json { render json: @consulta, status: :created, location: @consulta }
      else
        format.html { render action: "new", flash: { error: 'Erro ao enviar exame.' } }
        format.json { render json: @consulta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /consultas/1
  # PUT /consultas/1.json
  def update
    @consulta = Consulta.find(params[:id])

    respond_to do |format|
      if @consulta.update_attributes(params[:consulta])
        format.html { redirect_to @consulta, flash: { success: 'Exame editada com sucesso.' } }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @consulta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consultas/1
  # DELETE /consultas/1.json
  def destroy
    @consulta = Consulta.find(params[:id])
    @consulta.destroy

    respond_to do |format|
      format.html { redirect_to consultas_url, flash: { success: 'Exame excluido com sucesso.' } }
      format.json { head :no_content }
    end
  end
end