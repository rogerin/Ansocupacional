class FuncionariosController < ApplicationController
  # GET /funcionarios
  # GET /funcionarios.json
  def index
    # @funcionarios = Funcionario.all
    if session[:user]
      if session[:user_tipo] == 1
        @empresas = Empresa.all
      else
        @empresas = Empresa.where(user_id: session[:user_id])  
      end
    else
      @empresas = Empresa.where(empresa_id: session[:empresa_id])      
    end

    if params[:funcionario]
      @funcionarios = Funcionario.where(empresa_id: params[:funcionario][:empresa_id])
    else
      @funcionarios = []
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @funcionarios }
    end
  end

  def busca

    if session[:user]
      if session[:user_tipo] == 1
        @empresas = Empresa.all
      else
        @empresas = Empresa.where(user_id: session[:user_id])  
      end
    else
      @empresas = Empresa.where(empresa_id: session[:empresa_id])      
    end

    if params[:funcionario]
      @funcionarios = Funcionario.where(empresa_id: params[:funcionario][:empresa_id])
    else
      @funcionarios = []
    end




    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @funcionarios }
    end

  end

  # GET /funcionarios/1
  # GET /funcionarios/1.json
  def show
    @funcionario = Funcionario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @funcionario }
    end
  end

  # GET /funcionarios/new
  # GET /funcionarios/new.json
  def new
    @funcionario = Funcionario.new
    @empresas = Empresa.where(:user_id => session["user_id"])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @funcionario }
    end
  end

  # GET /funcionarios/1/edit
  def edit
    @funcionario = Funcionario.find(params[:id])
    @empresas = Empresa.where(:user_id => session["user_id"])
  end

  # POST /funcionarios
  # POST /funcionarios.json
  def create
    @funcionario = Funcionario.new(params[:funcionario])

    respond_to do |format|
      if @funcionario.save
        format.html { redirect_to @funcionario, flash: { success: 'Funcionario criado com sucesso.' } }
        format.json { render json: @funcionario, status: :created, location: @funcionario }
      else
        format.html { render action: "new" }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /funcionarios/1
  # PUT /funcionarios/1.json
  def update
    @funcionario = Funcionario.find(params[:id])

    respond_to do |format|
      if @funcionario.update_attributes(params[:funcionario])
        format.html { redirect_to @funcionario, flash: { success: 'Funcionario editado com sucesso.' } }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1
  # DELETE /funcionarios/1.json
  def destroy
    @funcionario = Funcionario.find(params[:id])
    @funcionario.destroy

    respond_to do |format|
      format.html { redirect_to funcionarios_url, flash: { success: 'Funcionario deletado com sucesso.' } }
      format.json { head :no_content }
    end
  end
end
