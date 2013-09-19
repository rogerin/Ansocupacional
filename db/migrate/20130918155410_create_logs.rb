class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :tipo
      t.integer :id
      t.string :mensagem

      t.timestamps
    end
  end
end
