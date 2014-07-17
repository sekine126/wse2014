class Procedure < ActiveRecord::Base

  belongs_to :recipe

  # YoutubeAPIから約sec秒の動画を取得する
  def search_at_youtube(keyword, sec)
    youtube = Youtube.video_info(keyword, sec)
  end

end
