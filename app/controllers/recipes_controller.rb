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
    @procedure=Procedure.new(procedure_params)
    @value=Value.new(value_params)

    respond_to do |format|
      if @recipe.save && @procedure.save && @value.save
        format.html { redirect_to @recipe }
      end
    end
  end

  private
    def recipe_params
      params[:recipe].permit(
        :name
        )
    end

    def procedure_params
      params.require(:procedure).permit(
        :number,
        :detail,
        :sec,
        :play,
        :recipe_id
        )
    end

    def value_params
      params[:value].permit(
        :food_id,
        :recipe_id,
        :value
        )
    end

end
