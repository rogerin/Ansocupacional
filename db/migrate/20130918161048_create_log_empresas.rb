class CreateLogEmpresas < ActiveRecord::Migration
  def change
    create_table :log_empresas do |t|
      t.integer :empresa_id
      t.string :mensagem

      t.timestamps
    end
  end
end
