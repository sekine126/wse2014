class ValuesController < ApplicationController
	def new
		if params[:select].blank?
			render :text => "<h1>ERROR</h1>"
		end

		@foods = Food.where(id: params[:select])
	end

	def index
		@values = Value.all
	end
end