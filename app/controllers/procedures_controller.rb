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
        # valueからの遷移時エラー
        if value[:val].blank?

          render :text => "<h1>value ERROR</h1>"
          # redirect_to :controller=>"values", :action=>"new", :select => params[:food_id]
        end
      end
    else
      @procedures.each do |procedure|
        # 手順追加時のエラー
        if procedure[:text].blank?
          render :text => "<h1>procedure ERROR</h1>"
          # redirect_to :controller=>"procedures", :action=>"new", :procedure => params[:procedure], :value => params[:value], :food_id => params[:food_id], :err=>true
        end
      end
    end

  end

end