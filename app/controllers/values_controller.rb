class ValuesController < ApplicationController
	def new
		@foods = Food.where(id: params[:select])
	end

	def index
		@values = Value.all
	end
end