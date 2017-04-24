class CreateMoivoiceLiveStreamComments < ActiveRecord::Migration[5.0]
  def change
    create_table :moivoice_live_stream_comments do |t|
      t.integer :user_id, null: false
      t.string :twitcast_social_id
      t.integer :live_stream_id, null: false
      t.integer :duration, null: false, default: 0
      t.text :message
      t.string :twitter_status_id
      t.string :voice_path
      t.timestamps
    end
    
    add_index :moivoice_live_stream_comments, :user_id
    add_index :moivoice_live_stream_comments, :duration
    add_index :moivoice_live_stream_comments, :live_stream_id
    add_index :moivoice_live_stream_comments, :twitter_status_id
  end
end
