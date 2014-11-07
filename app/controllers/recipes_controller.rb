class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @procedures = Procedure.where(recipe_id: params[:id])
  end

  def new
    @recipe = Recipe.new
    @foods = Food.where(id: params[:food_id])
    @values = params[:value]
    @procedures = params[:procedure]

    @procedures.each do |procedure|
      if procedure[:text].blank?
        render :text => "<h1>procedure ERROR</h1>"
      end
    end
  end

  def create
    @recipe=Recipe.new(params[:recipe])
    @recipe.save
  end

end
