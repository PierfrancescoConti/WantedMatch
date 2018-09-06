class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :usname
      t.string :password_digest
      t.string :teams, array: true, default: []
      t.string :email
      t.string :provider
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
