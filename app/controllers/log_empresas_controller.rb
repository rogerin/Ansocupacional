class LogEmpresasController < ApplicationController
  # GET /log_empresas
  # GET /log_empresas.json
  def index

    scope = LogEmpresa

    if session[:user_tipo] == 1
      @empresas = Empresa.all
    elsif session[:user_tipo] == 2
      @empresas = Empresa.where(:user_id => session[:user_id])
      scope = scope.where(:empresa_id => @empresas)
    else
      @empresas = Empresa.find(session[:empresa_id])
    end


    @log_empresas = scope.order("created_at DESC").limit(200)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @log_empresas }
    end
  end

  def busca
    scope = LogEmpresa

    if session[:user_tipo] == 1
      @empresas = Empresa.all
    elsif session[:user_tipo] == 2
      @empresas = Empresa.where(:user_id => session[:user_id])
      scope = scope.where(:empresa_id => @empresas)
    else
      @empresas = Empresa.find(session[:empresa_id])
    end



    if (params[:busca][:data_inicio].present? and params[:busca][:data_fim].present? )
      scope = scope.where(:created_at => params[:busca][:data_inicio].to_time.strftime("%Y-%m-%d")..params[:busca][:data_fim].to_time.strftime("%Y-%m-%d"))
    end
    if (params[:busca][:empresa_id].present?)
      scope = scope.where(:empresa_id => params[:busca][:empresa_id])
    end


    @log_empresas = scope.order("created_at DESC").limit(200)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @log_empresas }
    end    
  end

  # GET /log_empresas/1
  # GET /log_empresas/1.json
  def show
    @log_empresa = LogEmpresa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @log_empresa }
    end
  end

  # GET /log_empresas/new
  # GET /log_empresas/new.json
  def new
    @log_empresa = LogEmpresa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @log_empresa }
    end
  end

  # GET /log_empresas/1/edit
  def edit
    @log_empresa = LogEmpresa.find(params[:id])
  end

  # POST /log_empresas
  # POST /log_empresas.json
  def create
    @log_empresa = LogEmpresa.new(params[:log_empresa])

    respond_to do |format|
      if @log_empresa.save
        format.html { redirect_to @log_empresa, notice: 'Log empresa was successfully created.' }
        format.json { render json: @log_empresa, status: :created, location: @log_empresa }
      else
        format.html { render action: "new" }
        format.json { render json: @log_empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /log_empresas/1
  # PUT /log_empresas/1.json
  def update
    @log_empresa = LogEmpresa.find(params[:id])

    respond_to do |format|
      if @log_empresa.update_attributes(params[:log_empresa])
        format.html { redirect_to @log_empresa, notice: 'Log empresa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @log_empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /log_empresas/1
  # DELETE /log_empresas/1.json
  def destroy
    @log_empresa = LogEmpresa.find(params[:id])
    @log_empresa.destroy

    respond_to do |format|
      format.html { redirect_to log_empresas_url }
      format.json { head :no_content }
    end
  end
end
