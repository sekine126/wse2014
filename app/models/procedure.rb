class Procedure < ActiveRecord::Base

  belongs_to :recipe

  # YoutubeAPIから約sec秒の動画を取得する
  def search_at_youtube(keyword, sec)
    youtube = Youtube.video_info(keyword, sec)
  end

  def new
  	#render :text => params
  	#@values = Value.where(id: params[:select])
  end

end