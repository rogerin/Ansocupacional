class AddStatusToEmpresas < ActiveRecord::Migration
  def change
    add_column :empresas, :status, :integer, :null => false, :default => 1
  end
end
