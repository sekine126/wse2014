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

    if @procedures.blank?
      flash[:error] = "手順を入力してください"
      redirect_to :controller=>"procedures", :action=>"new", :procedure => params[:procedure], :value => params[:value], :food_id => params[:food_id], :from_value=>true
    end
  end

end
