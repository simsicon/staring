class CreateStrangers < ActiveRecord::Migration
  def change
    create_table :strangers do |t|
      t.string :uuid
      t.integer :duration

      t.timestamps null: false
    end

    add_index :strangers, :uuid
  end
end
