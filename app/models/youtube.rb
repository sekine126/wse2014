require 'rubygems'
require 'active_resource'

class Youtube < ActiveResource::Base # ActiveRecordからActiveResourceに変更

  # 取得先のサーバー名を指定
  self.site = "http://gdata.youtube.com"

  # YoutubeAPIが返してくれる項目名の中に$が含まれるものがあるため、$を_に修正する
  class Format
    include ActiveResource::Formats::JsonFormat
    def decode(json)
      super(json.gsub("$","_"))
    end
  end
  self.format = Format.new


  MAX_VIDEOS = 50 # 取得する動画の件数（MAX50まで）
  PERMISSION_ERROR = 15 # 動画時間の許容誤差
  @start_index = 1 # Youtubeから取得する動画リストの開始位置を記憶する変数


  # youtubeから引数で指定したワードで検索し、MAX_VIDEOS個の動画のリストを返す
  def self.videos(search_word)
    self.find(:one, from: "/feeds/api/videos", params: {q: search_word, :"start-index" => @start_index, :"max-results" => MAX_VIDEOS, alt: "json"} )
  end

  # 動画の取得
  def self.video_info(search_word, sec)
    # キーワードからMAX_VIDEOS個の動画のリストを取得する
    videos = self.videos(search_word)
    list = []
    videos.feed.entry.each do |ent|
      v_info = {}
      v_info[:url] = ent.attributes["media_group"].attributes["media_content"][0].attributes["url"] # URL
      v_info[:title] = ent.attributes["media_group"].attributes["media_title"].attributes["_t"] # タイトル
      v_info[:duration] = ent.attributes["media_group"].attributes["yt_duration"].attributes["seconds"] # 再生時間
      list << v_info
    end

    # sec秒に一番近い動画をリストから探す
    sameTimeVideo = list.first
    list.each { |l|
      if (l[:duration].to_i - sec).abs < (sameTimeVideo[:duration].to_i - sec).abs
        sameTimeVideo = l
      end
    }

    # 取得してきた動画の再生時間が許容誤差を超えていた場合、再帰的に繰り返す
    if (sameTimeVideo[:duration].to_i - sec).abs > PERMISSION_ERROR
      @start_index += MAX_VIDEOS
      self.video_info(search_word, sec)
    else
      sameTimeVideo
    end
  end


end
