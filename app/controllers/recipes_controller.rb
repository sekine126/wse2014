# coding:utf-8
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
    @values = params[:value]
    @procedures = params[:procedure]

    if @procedures.blank?
      flash[:error] = "手順を入力してください"
      redirect_to :controller=>"procedures", :action=>"new", :procedure => params[:procedure], :value => params[:value], :food_id => params[:food_id], :from_value=>true
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @procedures = Procedure.new(params[:procedure])
    @values = Value.new(params[:value])

    @procedures.recipe = @recipe
    @values.recipe = @recipe

    @recipe.save
    @procedures.save
    @values.save
  end

  private
    def recipe_params
      params[:recipe].permit(
        :name
        )
    end

end
