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

  def sec_text
    sec.to_i % 60
  end

  def min_text
    sec.to_i / 60
  end

  def get_sec(min, sec)
    min.to_i * 60 + sec.to_i
  end

end
