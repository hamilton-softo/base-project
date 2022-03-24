# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.all
  end

  def show
    head 404 unless @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render :show
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user
      if @user.update(user_params)
        render :show
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      head 404
    end
  end

  def destroy
    if @user
      @user.destroy
    else
      head 404
    end
  end

  private

  def set_user
    @user = User.where(id: params[:id]).first
  end

  def user_params
    params.require(:user).permit(:name, :cpf, :email, :address, :birthday, :active)
  end
end
