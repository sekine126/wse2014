class ValuesController < ApplicationController
	def new
		@foods = Food.all
		@value = Value.new
	end

	def create
		@foods = Food.where(id: params[:select])
		@value = Value.new(params[:value])
	end

	def index
		@values = Value.all
	end
end