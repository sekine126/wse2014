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

end
