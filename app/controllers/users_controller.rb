class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'El Usuario fue Creado Exitosamente' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  
  def edit_profile
    @user = current_user # Cargar el usuario actual, no es necesario autorizarlo aquí
    authorize! :update_profile, @user
  end

  def update_profile
    @user = current_user
    authorize! :update_profile, @user
    if @user.update_with_password(profile_params)
      bypass_sign_in(@user)
      redirect_to root_path, notice: "Perfil actualizado exitosamente."
    else
      flash[:alert] = "Errores al actualizar el perfil."
      render :edit_profile
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Usuario actualizado correctamente."
    else
      render :edit, notice: @user.errors
    end
  end

  def low_logic
    begin
      @user = User.find(params[:id])

      if @user.discontinued_at.nil?
        # Desactivar el usuario
        @user.update_columns(discontinued_at: Time.current)
        # Si el usuario que se desactiva es el actual, se cierra su sesión
        if @user == current_user
          sign_out(@user)  # Cierra la sesión solo del usuario desactivado
          flash[:notice] = 'Tu cuenta ha sido desactivada y has sido desconectado.'
        else
          flash[:notice] = 'Usuario desactivado correctamente.'
        end
      else
        # Reactivar el usuario
        @user.update_columns(discontinued_at: nil)
        flash[:notice] = 'Usuario reactivado correctamente.'
      end
    rescue => e
      flash[:alert] = "Ocurrió un error inesperado: #{e.message}"
    ensure
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :username, :rol_id)
  end

  def profile_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end
  
end