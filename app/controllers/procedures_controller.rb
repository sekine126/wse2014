# coding: utf-8
class ProceduresController < ApplicationController

  def show
    @recipe = Recipe.find(params[:recipe_id])
    @procedure = Procedure.find(params[:id])
    @procedures = Procedure.where(recipe_id: params[:recipe_id])

    if @procedure.play
      keyword = "ラブライブ！" # 動画検索キーワード
      @youtube = @procedure.search_at_youtube(keyword, @procedure.sec)
    end
  end

  def new
  	@foods = Food.where(id: params[:food_id])
  	@values= params[:value]
  	@procedures = params[:procedure]
    

    if params[:from_value]
      @values.each do |value|
        # valueからの遷移時エラー処理
        if value[:val].blank?
          render :text => "<h1>value ERROR</h1>"
        end
      end
    else
      @procedures.each do |procedure|
        # 手順追加時のエラー処理
        if procedure[:text].blank?
          render :text => "<h1>procedure ERROR</h1>"
        end
      end
    end    

  end

end
