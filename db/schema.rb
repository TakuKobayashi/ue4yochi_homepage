# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170424093830) do

  create_table "board_game_mania_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "event_id",                           null: false
    t.string   "type",                               null: false
    t.string   "keyword",                            null: false
    t.string   "title",                              null: false
    t.string   "url",                                null: false
    t.string   "description",                        null: false
    t.datetime "started_at",                         null: false
    t.datetime "ended_at",                           null: false
    t.integer  "limit",                  default: 0, null: false
    t.string   "address",                            null: false
    t.string   "place",                              null: false
    t.float    "lat",         limit: 24
    t.float    "lon",         limit: 24
    t.string   "owner_id",                           null: false
    t.string   "owner_name"
    t.index ["event_id", "type"], name: "board_gameevent_type_event_id_index", unique: true, using: :btree
    t.index ["keyword"], name: "board_gameevent_keyword_index", using: :btree
    t.index ["started_at", "ended_at"], name: "board_gameevent_published_range_index", using: :btree
  end

  create_table "board_game_mania_youtube_video_relateds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "youtube_video_id",    null: false
    t.integer "to_youtube_video_id", null: false
    t.index ["to_youtube_video_id"], name: "youtube_video_related_to_id_index", using: :btree
    t.index ["youtube_video_id"], name: "youtube_video_related_from_id_index", using: :btree
  end

  create_table "board_game_mania_youtube_video_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "youtube_video_id", null: false
    t.string  "tag",              null: false
    t.index ["tag"], name: "index_board_game_mania_youtube_video_tags_on_tag", using: :btree
    t.index ["youtube_video_id", "tag"], name: "youtube_video_id_tag_index", unique: true, using: :btree
  end

  create_table "board_game_mania_youtube_videos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "video_id",                          default: "", null: false
    t.integer  "youtube_channel_id"
    t.integer  "youtube_category_id"
    t.string   "title",                             default: "", null: false
    t.text     "description",         limit: 65535
    t.string   "thumnail_image_url",                default: "", null: false
    t.datetime "published_at"
    t.integer  "comment_count",                     default: 0,  null: false
    t.integer  "dislike_count",                     default: 0,  null: false
    t.integer  "like_count",                        default: 0,  null: false
    t.integer  "favorite_count",                    default: 0,  null: false
    t.bigint   "view_count",                        default: 0,  null: false
    t.index ["published_at"], name: "youtube_published_at_index", using: :btree
    t.index ["video_id"], name: "youtube_video_id_index", unique: true, using: :btree
    t.index ["youtube_channel_id"], name: "youtube_channel_id_index", using: :btree
  end

  create_table "moivoice_live_stream_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                                      null: false
    t.string   "twitcast_social_id"
    t.integer  "live_stream_id",                               null: false
    t.integer  "duration",                         default: 0, null: false
    t.text     "message",            limit: 65535
    t.string   "twitter_status_id"
    t.string   "voice_path"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["duration"], name: "index_moivoice_live_stream_comments_on_duration", using: :btree
    t.index ["live_stream_id"], name: "index_moivoice_live_stream_comments_on_live_stream_id", using: :btree
    t.index ["twitter_status_id"], name: "index_moivoice_live_stream_comments_on_twitter_status_id", using: :btree
    t.index ["user_id"], name: "index_moivoice_live_stream_comments_on_user_id", using: :btree
  end

  create_table "moivoice_live_streams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",       null: false
    t.string   "movieid"
    t.string   "live_url"
    t.string   "live_title"
    t.string   "thumbnail_url"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer  "state",         null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["movieid"], name: "index_moivoice_live_streams_on_movieid", using: :btree
    t.index ["started_at", "finished_at"], name: "moi_voice_live_finished_at_index", using: :btree
    t.index ["user_id"], name: "index_moivoice_live_streams_on_user_id", using: :btree
  end

  create_table "oauth_accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "type",                       null: false
    t.string   "uid",                        null: false
    t.string   "screen_uid"
    t.text     "token",        limit: 65535
    t.text     "token_secret", limit: 65535
    t.datetime "expired_at",                 null: false
    t.text     "extra_info",   limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["expired_at"], name: "index_oauth_accounts_on_expired_at", using: :btree
    t.index ["screen_uid"], name: "index_oauth_accounts_on_screen_uid", using: :btree
    t.index ["uid", "type"], name: "index_oauth_accounts_on_uid_and_type", unique: true, using: :btree
    t.index ["user_id"], name: "index_oauth_accounts_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "type"
    t.string   "name"
    t.string   "profileimage_url"
    t.string   "token",            null: false
    t.datetime "last_logined_at",  null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["last_logined_at"], name: "index_users_on_last_logined_at", using: :btree
    t.index ["token"], name: "index_users_on_token", unique: true, using: :btree
  end

end
