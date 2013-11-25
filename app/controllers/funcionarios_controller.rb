#encoding: utf-8
class FuncionariosController < ApplicationController
  # GET /funcionarios
  # GET /funcionarios.json
  def index
    # @funcionarios = Funcionario.all
    if session[:user]
      if session[:user_tipo] == 1
        @empresas = Empresa.all
        @funcionarios = Funcionario.all
      else
        @empresas = Empresa.where(user_id: session[:user_id])
        @funcionarios = []  
      end  
    end

    if session[:empresa_id]
      @empresa = Empresa.where(id: session[:empresa_id]).first
      @funcionarios = Funcionario.where(empresa_id: session[:empresa_id])    
    end

   

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @funcionarios }
    end
  end

  def busca

    scopeF = Funcionario

    if session[:user_tipo] == 1
      @empresas = Empresa.all
    elsif session[:user_tipo] == 2
      @empresas = Empresa.where(user_id: session[:user_id])
      scopeF = scopeF.where(:empresa_id => @empresas)
    end  
  
    if session[:empresa_id]
      @empresa = Empresa.where(:id => session[:empresa_id])
      scopeF = scopeF.where(empresa_id: session[:empresa_id])    
    end
   
    if params[:empresa][:empresa_id].present?
      scopeF = scopeF.where(empresa_id: params[:empresa][:empresa_id])
    end

    @funcionarios = scopeF.all

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
    if session[:user]
      if session[:user_tipo] == 1
        @empresas = Empresa.all
      else
        @empresas = Empresa.where(user_id: session[:user_id])
      end  
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @funcionario }
    end
  end

  # GET /funcionarios/1/edit
  def edit
    @funcionario = Funcionario.find(params[:id])
    if session[:user]
      if session[:user_tipo] == 1
        @empresas = Empresa.all
      else
        @empresas = Empresa.where(user_id: session[:user_id])
      end  
    end
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
        format.html { render new_funcionario_path }
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
