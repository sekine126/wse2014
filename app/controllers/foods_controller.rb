class FoodsController < ApplicationController
	def index
		@foods = Food.all
	end

	def new
		@foods = Food.all
		@categories = [FD_CATEGORY_MEAT, FD_CATEGORY_FISH, FD_CATEGORY_VEGE, FD_CATEGORY_EGG, FD_CATEGORY_RETORT, FD_CATEGORY_SPICE, FD_CATEGORY_FURUIT]
		@cat_name = [FD_NAME_MEAT, FD_NAME_FISH, FD_NAME_VEGE, FD_NAME_EGG, FD_NAME_RETORT, FD_NAME_SPICE, FD_NAME_FURUIT]
	end
end
