class ExamesController < ApplicationController
  # GET /exames
  # GET /exames.json
  def index
    if params[:categoria]
      @exames = Exame.where(categoria_id: params[:categoria][:categoria_id])
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
    if params[:categoria]
      @exames = Exame.where(categoria_id: params[:categoria][:categoria_id])
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
    post = Exame.save(params[:exame][:link])
    
    
    @exame = Exame.new(link: post, categoria_id: params[:exame][:categoria_id], funcionario_id: params[:exame][:funcionario_id])


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
