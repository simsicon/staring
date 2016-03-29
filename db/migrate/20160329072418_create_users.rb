class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :login_count
      t.integer :login_duration

      t.timestamps null: false
    end
  end
end
