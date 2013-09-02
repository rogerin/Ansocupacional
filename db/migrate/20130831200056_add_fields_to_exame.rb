class AddFieldsToExame < ActiveRecord::Migration
  def change
    add_column :exames, :empresa_id, :integer
  end
end
