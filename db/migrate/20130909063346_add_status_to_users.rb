class AddStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :integer, :null => false, :default => 2
  end
end
