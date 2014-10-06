class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
  	render :text => params
  	#@values = Value.where()
  end

end
