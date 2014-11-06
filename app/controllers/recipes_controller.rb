class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @procedures = Procedure.where(recipe_id: params[:id])
  end

  def new
    @foods = Food.where(id: params[:food_id])
    @values = params[:value]
    @procedures = params[:procedure]

    @procedures.each do |procedure|
      if procedure[:text].blank?
        render :text => "<h1>procedure ERROR</h1>"
        # redirect_to :back, alert: '手順を入力してください'
      end
    end

    render :text => params
  end

end
