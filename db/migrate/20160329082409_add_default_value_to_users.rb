class AddDefaultValueToUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :login_count, 0
    change_column_default :users, :login_duration, 0
  end
end
