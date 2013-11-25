class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios, :id => false do |t|
	  t.integer :id, :null => false
      t.string :nome
      t.string :rg
      t.integer :empresa_id

      t.timestamps
    end
  end
end
