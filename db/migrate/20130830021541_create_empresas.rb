class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nome
      t.string :cnpj
      t.string :email
      t.string :login
      t.string :password_digest
      t.integer :user_id

      t.timestamps
    end
  end
end
