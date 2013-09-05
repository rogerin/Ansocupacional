class ExamesController < ApplicationController
  # GET /exames
  # GET /exames.json
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
    @por_categoria = []
    @por_empresa = []
    @por_inicio = []
    @por_funcionarios = []

    

     if params[:busca][:nome].present?

      @funcionarios_ids = Funcionario.find_by_sql("select id from funcionarios WHERE nome LIKE '%#{params[:busca][:nome]}%' or rg LIKE '%#{params[:busca][:nome]}%'")
       @ids = []
      @funcionarios_ids.each do |func|
        @ids << func.id
      end
      @por_funcionarios = Exame.where(:funcionario_id => @ids)


    end

    if params[:busca][:categoria_id].present?
      @por_categoria =  Exame.where(categoria_id: params[:busca][:categoria_id])
    end
    if params[:busca][:empresa_id].present?
      @por_empresa =  Exame.where(empresa_id: params[:busca][:empresa_id])
    end
    if params[:busca][:data_inicio].present?
      @por_inicio =  Exame.where(:created_at => Time.parse(params[:busca][:data_inicio])...Time.parse(params[:busca][:data_fim]))
    end

    @exames = @por_categoria+@por_empresa+@por_inicio+@por_funcionarios


    
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

    @categorias = Categoria.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exames }
    end
  end

  # GET /exames/1
  # GET /exames/1.json
  def show
    @exame = Exame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exame }
    end
  end

  # GET /exames/new
  # GET /exames/new.json
  def new
    @exame = Exame.new

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

      @funcionarios = []
    end

     @categorias = Categoria.all



    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exame }
    end
  end

  # GET /exames/1/edit
  def edit
    @exame = Exame.find(params[:id])
  end

  # POST /exames
  # POST /exames.json
  def create
    post = Exame.save(params[:exame][:link],params[:exame][:funcionario_id])
    
    
    @exame = Exame.new(link: post, categoria_id: params[:exame][:categoria_id], funcionario_id: params[:exame][:funcionario_id], empresa_id: params[:exame][:empresa_id])


    respond_to do |format|
      if @exame.save
        format.html { redirect_to @exame, notice: 'Exame was successfully created.' }
        format.json { render json: @exame, status: :created, location: @exame }
      else
        format.html { render action: "new" }
        format.json { render json: @exame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exames/1
  # PUT /exames/1.json
  def update
    @exame = Exame.find(params[:id])

    respond_to do |format|
      if @exame.update_attributes(params[:exame])
        format.html { redirect_to @exame, notice: 'Exame was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exames/1
  # DELETE /exames/1.json
  def destroy
    @exame = Exame.find(params[:id])
    @exame.destroy

    respond_to do |format|
      format.html { redirect_to exames_url }
      format.json { head :no_content }
    end
  end
end
