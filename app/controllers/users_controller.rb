class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index] 
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    authorize! :create, @user
  end

  def create
    @user = User.new user_params
    authorize! :create, @user

    if @user.save

      redirect_to @user, as: :user, flash: { success: t('validation.create', model: @user.class.model_name.human.downcase) }
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize! :update, @user
  end

  def update
    @user = User.find(params[:id])
    authorize! :update, @user

    if @user.update_attributes(user_params)
      redirect_to @user, as: :user, flash: { success: t('validation.update', model: @user.class.model_name.human.downcase) }
    else
      render 'edit'
    end
  end

  def destroy
    authorize! :destroy, @user
    @user = User.find(params[:id])

    @user.destroy
    redirect_to new_user_path, flash: { success: t('validation.destroy', model: @user.class.model_name.human.downcase) }
  end
  
private

  def user_params
    params.require(:user).permit(:avatar_cache, :avatar, :birthdate, :country_code, :email, :firstname, :lastname, :password, :password_confirmation, :phone, :street, :town, :type)
  end
end
