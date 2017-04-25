class CreateBoardGameManiaEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :board_game_mania_events do |t|
      t.string :event_id, null: false
      t.string :type, null: false
      t.string :keyword, null: false
      t.string :title, null: false
      t.string :url, null: false
      t.string :description, null: false
      t.datetime :started_at, null: false
      t.datetime :ended_at, null: false
      t.integer :limit, null: false, default: 0
      t.string :address, null: false
      t.string :place, null: false
      t.float :lat
      t.float :lon
      t.string :owner_id, null: false
      t.string :owner_name
    end
    add_index :board_game_mania_events, [:event_id, :type], unique: true, name: "board_gameevent_type_event_id_index"
    add_index :board_game_mania_events, [:started_at, :ended_at], name: "board_gameevent_published_range_index"
    add_index :board_game_mania_events, :keyword, name: "board_gameevent_keyword_index"
  end
end
