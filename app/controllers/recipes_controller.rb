# coding:utf-8
class RecipesController < ApplicationController

  def index
    @recipes = Recipe.search(params[:search])
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
    if @recipe.save
      # do nothing
    else
      logger.debug("recipe save failed!")
    end

    params[:procedure].each { |p| 
      @procedure = Procedure.new
      @procedure.play = p[:play]
      @procedure.number = p[:number]
      @procedure.detail = p[:detail]
      @procedure.sec = p[:sec]
      @procedure.recipe = @recipe
      logger.debug(@procedure.inspect)
      if @procedure.save
        # do nothing
      else
        logger.debug("recipe save failed!")
      end
    }

    params[:value].each { |v| 
      @value = Value.new
      @value.value = v[:value]
      @value.food_id = v[:food_id]
      @value.recipe = @recipe
      logger.debug(@procedure.inspect)
      if @value.save
        # do nothing
      else
        logger.debug("value save failed!")
      end
    }

    @procedures = @recipe.procedures
    @values = @recipe.values
    logger.debug(@procedures.inspect)
    logger.debug(@values.inspect)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to(root_url) }
      format.xml  { head :ok }
    end
  end

  private
    def recipe_params
      params[:recipe].permit(
        :name
        )
    end

end
