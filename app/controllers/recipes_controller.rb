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
    @foods = Food.where(id: params[:food_id])
    @values = params[:value]
    @procedures = params[:procedure]
    @recipe=Recipe.new

    if @procedures.blank?
      flash[:error] = "手順を入力してください03"
      redirect_to :controller=>"procedures", :action=>"new", :procedure => params[:procedure], :value => params[:value], :food_id => params[:food_id], :from_value=>true
    end
  end

  def create
    @recipe=Recipe.new(recipe_params)
    @procedures=Procedure.new(procedure_params)
    @values=Value.new(value_params)

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

    def procedure_params
      params[:recipe].permit(
        :number,
        :detail,
        :sec,
        :play,
        :recipe_id
        )
    end

    def value_params
      params[:recipe].permit(
        :food_id,
        :recipe_id,
        :value
        )
    end

end
