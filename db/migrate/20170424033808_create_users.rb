class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :type
      t.string :name
      t.string :profileimage_url
      t.string :token, null: false
      t.datetime :last_logined_at, null: false
      t.timestamps
    end
    add_index :users, :token, unique: true
    add_index :users, :last_logined_at
  end
end
