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
  	@foods = Food.all
  	@values= params[:value]
  	@procedures = params[:procedure]



    if params[:from_value]
      if @values.any?{|value| value[:value].blank?}
        flash[:error] = "未入力項目があります"
        redirect_to :controller=>"values", :action=>"new", :select => params[:food_id]
      end
    else
      if params[:procedure].present?
        if @procedures.any?{|procedure| procedure[:detail].blank?}
          tmp = params[:procedure].pop
          flash[:error] = "手順を入力してください"
          if @procedures.any?{|procedure| procedure[:detail].present?}
            redirect_to :controller=>"procedures", :action=>"new", :procedure => params[:procedure], :value => params[:value], :food_id => params[:food_id]
          else
            redirect_to :controller=>"procedures", :action=>"new", :procedure => params[:procedure], :value => params[:value], :food_id => params[:food_id], :from_value=>true
          end
        end
      end
    end

  end

end
