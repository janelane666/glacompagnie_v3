class Resources::ImagesController < ApplicationController
	def show
		render :file => "app/assets/resources/%d/%s_%d.jpg" % [params[:id], params[:type], params[:id]]
		# Glacon.find(params[:id]).name + '.jpg' 
	end
end