class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    if params[:user][:link]
       post = User.save(params[:user][:link])
    else
      post = 'ans.png'
    end
    
  
    @user = User.new(link: post, email: params[:user][:email], login: params[:user][:login], nome: params[:user][:nome], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation], tipo: params[:user][:tipo])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, flash: { success: 'User criado com sucesso.' }  }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, flash: { success: 'User editado com sucesso.' } }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def desabilitar
    User.where(:id => params[:id]).update_all(:status => 0)
    redirect_to users_path
  end

  def habilitar
    User.where(:id => params[:id]).update_all(:status => 1)
    redirect_to users_path
  end

  



  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, flash: { success: 'User deletado com sucesso.' } }
      format.json { head :no_content }
    end
  end
end
