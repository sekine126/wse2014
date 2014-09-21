class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @procedures = Procedure.where(recipe_id: params[:id])
  end

end
