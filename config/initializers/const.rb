
# ---------------------------------------------------------------------------
# YoutubeAPI関連の定数定義
# ---------------------------------------------------------------------------
YT_SERVER = "http://gdata.youtube.com" # 取得先のサーバー名
YT_FEEDS = "/feeds/api/videos" # フィードの取得先
YT_FORMAT = "json" # 取得ファイルフォーマット
YT_START_INIT = 1 # 取得する動画リストの開始位置の初期値
YT_MAX_VIDEOS = 50 # 一度に取得する動画の件数（MAX50まで）
YT_SEARCH_MAX_VIDEOS = 501 # 取得対象の最大動画件数
YT_PERMISSION_OR = 100 # 許容誤差を割合にするボーダー
YT_PERMISSION_SEC = 1 # 動画時間の初期許容誤差
YT_UP_SEC = 1 # 許容誤差割合の逐次増加
YT_PERMISSION_PERCENT = 0.1 # 動画時間の初期許容誤差割合
YT_UP_PERCENT = 0.05 # 許容誤差割合の逐次増加割合

# URL要素を取得するためのタグ定義
YT_URL_TAG_GROUP = "media_group" # 親タグ
YT_URL_TAG = "media_content" # タグ
YT_URL_TAG_NUM = 0 # タグ内番号
YT_URL_ELEMENT = "url" # 要素名
# TITLE要素を取得するためのタグ定義
YT_TITLE_TAG_GROUP = "media_group" # 親タグ
YT_TITLE_TAG = "media_title" # タグ
YT_TITLE_ELEMENT = "_t" # 要素名
# DURATION要素を取得するためのタグ定義
YT_DURATION_TAG_GROUP = "media_group" # 親タグ
YT_DURATION_TAG = "yt_duration" # タグ
YT_DURATION_ELEMENT = "seconds" # 要素名
