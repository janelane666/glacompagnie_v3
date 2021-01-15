class Resources::ImagesController < ApplicationController
	def show
		render :file => Glacon.find(params[:id]).image[1...]
	end
end