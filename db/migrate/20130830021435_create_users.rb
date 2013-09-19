class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nome
      t.string :email
      t.string :password_digest
      t.string :login
      t.integer :tipo, :null => false, :default => 2

      t.timestamps
    end
  end
end
