class Api::V1::UsersController < ApplicationController
  def index
    render json:User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.create(user_params)
    render json: user
  end

  def destroy
    User.destroy(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(user_params)
    render json: user
  end

  private

  def user_params 
    params.require(:user).permit(:id, :name, :surname, :birthdate, :address, :zipocde, :city, :country, :phone, :email, :password)
  end
end