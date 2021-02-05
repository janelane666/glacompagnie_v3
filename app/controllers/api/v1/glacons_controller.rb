require "open-uri"
require "fileutils"

class Api::V1::GlaconsController < ApplicationController
  def index
    render json: Glacon.all
  end

  def show
    render json: Glacon.find(params[:id])
  end

  def  create
    glacon = Glacon.create(glacon_params)
    # get_resources(glacon, params) 

    render json: glacon
  end

  def destroy
    Glacon.destroy(params[:id])
    glacon_dir = 'app/assets/resources/%d' % [params[:id]]
    if File.directory?(glacon_dir)
      FileUtils.remove_dir(glacon_dir) 
    end 
  end

  def update
    glacon = Glacon.find(params[:id])
    glacon.update_attributes(glacon_params)
    #get_resources(glacon, params)
    render json: glacon
  end

  private

  def get_resources(glacon, params) 
    glacon_dir = 'app/assets/resources/%d' % [params[:id]]

    if File.directory?(glacon_dir)
      resource_types = params[:resources].keys

      Dir.mkdir("app/assets/resources/%d" % [glacon.id])
      for type in resource_types
        File.open('app/assets/resources/%d/%s_%d.%s' % [glacon[:id], type, glacon[:id], params[:resources][type][:format]], 'wb') do |fo|
          fo.write open(params[:resources][type][:url]).read 
        end
      end
    end
  end


  def glacon_params
    params.require(:glacon).permit(:id, :name, :description, :price, :local_name, :quantity, :resources)
  end
end