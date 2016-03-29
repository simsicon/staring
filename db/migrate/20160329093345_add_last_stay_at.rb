class AddLastStayAt < ActiveRecord::Migration
  def change
    add_column :users, :last_stay_at, :datetime
    add_column :strangers, :last_stay_at, :datetime

    add_index :users, :last_stay_at
    add_index :strangers, :last_stay_at
  end
end
