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

  # POST / exames/busca
  def busca
    
    @por_empresa = []
    @por_inicio = []
    @por_funcionarios = []

    if session[:user] == 1
      @empresas_ids = Empresa.all
      @ids_empresas = []
      @empresas_ids.each do |emp|
        @ids_empresas << emp.id
      end
    elsif session[:user] == 2
      @empresas_ids = Empresa.where(:user_id => session[:user_id])
      @ids_empresas = []
      @empresas_ids.each do |emp|
        @ids_empresas << emp.id
      end

    else
      @empresas_ids = Empresa.where(:user_id => session[:empresa_id])
      @ids_empresas = []
      @empresas_ids.each do |emp|
        @ids_empresas << emp.id
      end
    end

    

   if params[:busca][:nome].present?

    @funcionarios_ids = Funcionario.find_by_sql("select id from funcionarios WHERE nome LIKE '%#{params[:busca][:nome]}%' or rg LIKE '%#{params[:busca][:nome]}%'")
    
      @ids = []
      @funcionarios_ids.each do |func|
        @ids << func.id
      end
    @por_funcionarios = Consulta.where(:funcionario_id => @ids, :empresa_id => @empresas_ids)
  end

    if params[:busca][:categoria_id].present?
      

      @por_categoria =  Consulta.where(categoria_id: params[:busca][:categoria_id],empresa_id: @ids_empresas)
    end
    
    if params[:busca][:empresa_id].present?
      @por_empresa =  Consulta.where(empresa_id: params[:busca][:empresa_id])
    end
    
    if params[:busca][:data_inicio].present?
        if params[:busca][:empresa_id].present?
           @por_inicio =  Consulta.where(:empresa_id => params[:busca][:empresa_id],:created_at => Time.parse(params[:busca][:data_inicio])...Time.parse(params[:busca][:data_fim]))
        else
          if session[:user_tipo] == 1
            @por_inicio =  Consulta.where(:created_at => Time.parse(params[:busca][:data_inicio])...Time.parse(params[:busca][:data_fim]))
          elsif session[:user_tipo] == 2
            @por_inicio =  Consulta.where(:empresa_id => @ids_empresas,:created_at => Time.parse(params[:busca][:data_inicio])...Time.parse(params[:busca][:data_fim]))
          else
            @por_inicio =  Consulta.where(:empresa_id => session[:empresa_id],:created_at => Time.parse(params[:busca][:data_inicio])...Time.parse(params[:busca][:data_fim]))

          end
              
        end
    end

    @exames = @por_empresa+@por_inicio+@por_funcionarios


    
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
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @consultas }
    end
  end

  def busca
    @por_categoria = []
    @por_empresa = []
    @por_inicio = []
    @por_funcionarios = []


    if session[:user]
      @empresas_ids = Empresa.where(:user_id => session[:user_id])
      @ids_empresas = []
      @empresas_ids.each do |emp|
        @ids_empresas << emp.id
      end
    else
      @empresas_ids = Empresa.where(:user_id => session[:empresa_id])
      @ids_empresas = []
      @empresas_ids.each do |emp|
        @ids_empresas << emp.id
      end
    end


    

   if params[:busca][:nome]

    @funcionarios_ids = Funcionario.find_by_sql("select id from funcionarios WHERE nome LIKE '%#{params[:busca][:nome]}%' or rg LIKE '%#{params[:busca][:nome]}%'")

      @ids = []
      @funcionarios_ids.each do |func|
        @ids << func.id
      end
    @por_funcionarios = Consulta.where(:funcionario_id => @ids, :empresa_id => @empresas_ids)
  end

    
    if params[:busca][:empresa_id].present?
      @por_empresa =  Consulta.where(empresa_id: params[:busca][:empresa_id])
    end
    
    if params[:busca][:data_inicio].present?
        if params[:busca][:empresa_id].present?
           @por_inicio =  Consulta.where(:empresa_id => params[:busca][:empresa_id],:created_at => Time.parse(params[:busca][:data_inicio])...Time.parse(params[:busca][:data_fim]))
        else
          if session[:user_tipo] == 1
            @por_inicio =  Consulta.where(:created_at => Time.parse(params[:busca][:data_inicio])...Time.parse(params[:busca][:data_fim]))
          elsif session[:user_tipo] == 2
            @por_inicio =  Consulta.where(:empresa_id => @ids_empresas,:created_at => Time.parse(params[:busca][:data_inicio])...Time.parse(params[:busca][:data_fim]))
          else
            @por_inicio =  Consulta.where(:empresa_id => session[:empresa_id],:created_at => Time.parse(params[:busca][:data_inicio])...Time.parse(params[:busca][:data_fim]))

          end
              
        end
    end

     #@consulta = @por_empresa+@por_inicio+@por_funcionarios
     @consulta = @por_categoria+@por_empresa+@por_inicio+@por_funcionarios


    
    if session[:empresa_id]
      @funcionarios = Funcionario.order('nome').where(empresa_id: session[:empresa_id])
      @empresas = Empresa.order('nome').where(id: session[:empresa_id])
      @empresa = true
    else
      @empresa = false
      if session[:user_tipo] == 1
        @empresas = Empresa.order('nome').all    
      else
        @empresas = Empresa.order('nome').where(user_id: session[:user_id])  
      end
     
    end

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
