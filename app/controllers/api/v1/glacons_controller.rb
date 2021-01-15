class Api::V1::GlaconsController < ApplicationController
  def index
    render json: Glacon.all
  end

  def show
    render json: Glacon.find(params[:id])
  end

  def create
    glacon = Glacon.create(glacon_params)
    render json: glacon
  end

  def destroy
    Glacon.destroy(params[:id])
  end

  def update
    glacon = Glacon.find(params[:id])
    glacon.update_attributes(glacon_params)
    render json: glacon
  end

  private

  def glacon_params
    params.require(:glacon).permit(:id, :name, :description, :price, :image, :quantity)
  end
end
