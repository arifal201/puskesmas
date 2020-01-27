class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :edit, :update]
  before_action :set_user, only: [:show, :destroy, :edit, :update]
  def index
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    session[:user_id] = @user.id

    redirect_to '/authorized'
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to authorized_url, notice: 'Pasien was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username,:password,:nik,:name,:alamat)
  end
end

