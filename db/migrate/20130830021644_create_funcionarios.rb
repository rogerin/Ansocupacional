class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :rg
      t.integer :empresa_id

      t.timestamps
    end
  end
end
