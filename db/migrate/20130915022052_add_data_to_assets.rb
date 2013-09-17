class AddDataToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :data, :date
  end
end
