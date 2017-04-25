class CreateBoardGameManiaYoutubeVideoTags < ActiveRecord::Migration[5.0]
  def change
    create_table :board_game_mania_youtube_video_tags do |t|
      t.integer :youtube_video_id, null: false
      t.string :tag, null: false
    end
    add_index :board_game_mania_youtube_video_tags, [:youtube_video_id, :tag], unique: true, name: "youtube_video_id_tag_index"
    add_index :board_game_mania_youtube_video_tags, :tag
  end
end
