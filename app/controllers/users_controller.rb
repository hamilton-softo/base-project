class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.all
  end

  def create
    @user = User.create!(user_params)
    render 'users/show', status: 201
  end

  def show
  end

  def update
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(:name, :cpf, :email, :address, :birthday, :active)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
