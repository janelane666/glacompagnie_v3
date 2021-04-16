class Api::V1::GlaconsController < ApplicationController
  def index
    query, filter = {}, {}
    allowed_querys = ['uuid', 'slug']
    allowed_filters = ['min_price', 'max_price']

    params.keys.each { |key|
      if allowed_querys.include? key
        query[key] = params[key]
      elsif allowed_filters.include? key
        filter[key] = params[key]
      end
    }

    if params[:single] == "true"
      if  params[:id]
        json = Glacon.find(params[:id])
      else
        json = Glacon.find_by(query)
      end
    else
      glacons_data = Glacon.where({}).select("id, name, description, price, quantity, created_at, updated_at, slug, uuid, thumbnail")
      json = []

        for el in glacons_data
        if filter != {}
          min_price = filter["min_price"] && filter["min_price"].to_i != 0 ?  filter["min_price"].to_f : 0
          max_price = filter["max_price"] && filter["max_price"].to_i != 0 ?  filter["max_price"].to_f : 1000000

          if min_price <= el[:price] && el[:price] <= max_price
            json.push(el)
          end
        else
          json.push(el)
        end
      end
    end

    render json: json
  end

  def show
    render json: Glacon.find(params[:id])
  end

  def  create
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
    params.require(:glacon).permit(:id, :name, :description, :price, :quantity, :resources, :header, :thumbnail)
  end
end