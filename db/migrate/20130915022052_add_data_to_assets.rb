class AddDataToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :data, :date, :null => true
  end
end
