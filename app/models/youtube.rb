require 'rubygems'
require 'active_resource'

class Youtube < ActiveResource::Base # ActiveRecordからActiveResourceに変更

  @start_index = YT_START_INIT # 取得する動画リストの開始位置を記憶する変数
  @up_count = 0 # 許容誤差を緩和した回数

  # 取得先のサーバー名を指定
  self.site = YT_SERVER

  # YoutubeAPIが返してくれる項目名の中に$が含まれるものがあるため、$を_に修正する
  class Format
    include ActiveResource::Formats::JsonFormat
    def decode(json)
      super(json.gsub("$","_"))
    end
  end
  self.format = Format.new

  # 引数で指定したワードで検索し、動画のリストを返す
  def self.videos(search_word)
    self.find(:one, from: YT_FEEDS, params: {q: search_word, :"start-index" => @start_index, :"max-results" => YT_MAX_VIDEOS, alt: YT_FORMAT} )
  end

  # 動画の取得
  def self.video_info(search_word, sec)
    # キーワードから動画のリストを取得する
    videos = self.videos(search_word)
    list = []
    videos.feed.entry.each do |ent|
      v_info = {}
      v_info[:url] = ent.attributes[YT_URL_TAG_GROUP].attributes[YT_URL_TAG][YT_URL_TAG_NUM].attributes[YT_URL_ELEMENT] # URL
      v_info[:title] = ent.attributes[YT_TITLE_TAG_GROUP].attributes[YT_TITLE_TAG].attributes[YT_TITLE_ELEMENT] # タイトル
      v_info[:duration] = ent.attributes[YT_DURATION_TAG_GROUP].attributes[YT_DURATION_TAG].attributes[YT_DURATION_ELEMENT] # 再生時間
      list << v_info
    end

    # 許容誤差を計算
    if sec < YT_PERMISSION_OR
      permissionSec = sec + (YT_PERMISSION_SEC + (YT_UP_SEC * @up_count))
    else
      permissionSec = sec * (YT_PERMISSION_PERCENT + (YT_UP_PERCENT * @up_count))
    end

    # 指定された秒数に一番近い再生時間の動画をリストから探す
    sameTimeVideo = list.first
    list.each { |l|
      if (l[:duration].to_i - sec).abs < (sameTimeVideo[:duration].to_i - sec).abs
        sameTimeVideo = l
      end
    }

    # 取得してきた動画の再生時間が許容誤差を超えていた場合、再帰的に繰り返す
    if (sameTimeVideo[:duration].to_i - sec).abs > permissionSec
      @start_index += YT_MAX_VIDEOS
      if @start_index > YT_SEARCH_MAX_VIDEOS
        @start_index = YT_START_INIT
        @up_count += 1
      end
      self.video_info(search_word, sec)
    else
      @start_index = YT_START_INIT
      @up_count = 0
      sameTimeVideo
    end
  end

end
