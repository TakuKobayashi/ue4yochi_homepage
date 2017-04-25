class CreateBoardGameManiaYoutubeVideoRelateds < ActiveRecord::Migration[5.0]
  def change
    create_table :board_game_mania_youtube_video_relateds do |t|
      t.integer :youtube_video_id, null: false
      t.integer :to_youtube_video_id, null: false
    end

    add_index :board_game_mania_youtube_video_relateds, :youtube_video_id, name: "youtube_video_related_from_id_index"
    add_index :board_game_mania_youtube_video_relateds, :to_youtube_video_id, name: "youtube_video_related_to_id_index"
  end
end
