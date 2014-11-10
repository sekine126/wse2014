# -*- coding: utf-8 -*-

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


# ---------------------------------------------------------------------------
# 食材関連の定数定義
# ---------------------------------------------------------------------------
# 食材カテゴリ
FD_CATEGORY_MEAT = 1
FD_CATEGORY_FISH = 2
FD_CATEGORY_VEGE = 3
FD_CATEGORY_EGG = 4
FD_CATEGORY_RETORT = 5
FD_CATEGORY_SPICE = 6
FD_CATEGORY_FURUIT = 7

# 食材名
FD_NAME_MEAT = "肉"
FD_NAME_FISH = "魚介"
FD_NAME_VEGE = "野菜"
FD_NAME_EGG = "主食・卵乳製品"
FD_NAME_RETORT = "加工品・乾物・海藻・レトルト"
FD_NAME_SPICE = "調味料・たれ・ドリンク・スパイス"
FD_NAME_FURUIT = "フルーツ"

# 食材サブカテゴリ(開始id)
FD_SUBCATEGORY_BEEF = 1
FD_SUBCATEGORY_PORK = 13
FD_SUBCATEGORY_CHICKEN = 26

FD_SUBCATEGORY_FISH = 37

FD_SUBCATEGORY_VEGE = 66

FD_SUBCATEGORY_RICE = 130
FD_SUBCATEGORY_NOODLE = 139
FD_SUBCATEGORY_EGG = 145
FD_SUBCATEGORY_POWDER = 169	

FD_SUBCATEGORY_PROCESS_MEAT = 173
FD_SUBCATEGORY_PROCESS_VEGE = 181
FD_SUBCATEGORY_PROCESS_FISH = 190
FD_SUBCATEGORY_DRY = 202
FD_SUBCATEGORY_PICKLE = 223
FD_SUBCATEGORY_BOTTLE = 230
FD_SUBCATEGORY_RETORT = 250

FD_SUBCATEGORY_CONDIMENT = 269
FD_SUBCATEGORY_DRINK = 308
FD_SUBCATEGORY_SAUCE = 322
FD_SUBCATEGORY_SPICE = 332

FD_SUBCATEGORY_FRUIT = 350


# サブカテゴリ名

FD_SUBNAME_BEEF = "牛肉"
FD_SUBNAME_PORK = "豚肉"
FD_SUBNAME_CHICKEN = "鶏肉"

FD_SUBNAME_FISH = "魚介"

FD_SUBNAME_VEGE = "野菜"

FD_SUBNAME_RICE = "米・パン130"
FD_SUBNAME_NOODLE = "麺"
FD_SUBNAME_EGG = "卵・乳製品"
FD_SUBNAME_POWDER = "粉"

FD_SUBNAME_PROCESS_MEAT = "肉加工品"
FD_SUBNAME_PROCESS_VEGE = "植物加工品"
FD_SUBNAME_PROCESS_FISH = "練り物"
FD_SUBNAME_DRY = "乾物・海藻"
FD_SUBNAME_PICKLE = "漬物"
FD_SUBNAME_BOTTLE = "瓶"
FD_SUBNAME_RETORT = "ルー・レトルト"

FD_SUBNAME_CONDIMENT = "調味料"
FD_SUBNAME_DRINK = "酒・ドリンク"
FD_SUBNAME_SAUCE = "たれ"
FD_SUBNAME_SPICE = "薬味・ドリンク"

FD_SUBNAME_FRUIT = "フルーツ"
