class CreateBoardGameManiaYoutubeVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :board_game_mania_youtube_videos do |t|
      t.string :video_id, null: false, default: ''
      t.integer :youtube_channel_id
      t.integer :youtube_category_id
      t.string :title, null: false, default: ''
      t.text :description
      t.string :thumnail_image_url, null: false, default: ''
      t.datetime :published_at
      t.integer :comment_count, null: false, default: 0
      t.integer :dislike_count, null: false, default: 0
      t.integer :like_count, null: false, default: 0
      t.integer :favorite_count, null: false, default: 0
      t.integer :view_count, null: false, default: 0, limit: 8
    end

    add_index :board_game_mania_youtube_videos, :youtube_channel_id, name: "youtube_channel_id_index"
    add_index :board_game_mania_youtube_videos, :published_at, name: "youtube_published_at_index"
    add_index :board_game_mania_youtube_videos, :video_id, unique: true, name: "youtube_video_id_index"
  end
end
