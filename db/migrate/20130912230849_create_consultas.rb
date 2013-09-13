class CreateConsultas < ActiveRecord::Migration
  def change
    create_table :consultas do |t|
      t.integer :funcionario_id
      t.integer :empresa_id

      t.timestamps
    end
  end
end
