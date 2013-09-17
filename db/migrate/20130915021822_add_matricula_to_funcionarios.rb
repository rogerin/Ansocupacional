class AddMatriculaToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :matricula, :string
  end
end
