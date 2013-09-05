class CreateExames < ActiveRecord::Migration
  def change
    create_table :exames do |t|
      t.string :link
      t.integer :categoria_id
      t.integer :funcionario_id
      t.integer :empresa_id


      t.timestamps
    end
  end
end
