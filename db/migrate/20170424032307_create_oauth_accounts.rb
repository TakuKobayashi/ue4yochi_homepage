class CreateOauthAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :oauth_accounts do |t|
      t.integer :user_id
      t.string :type, null: false
      t.string :uid, null: false
      t.string :screen_uid
      t.text :token
      t.text :token_secret
      t.datetime :expired_at, null: false
      t.text :extra_info
      t.timestamps
    end
    add_index :oauth_accounts, [:uid, :type], unique: true
    add_index :oauth_accounts, :user_id
    add_index :oauth_accounts, :screen_uid
    add_index :oauth_accounts, :expired_at
  end
end
