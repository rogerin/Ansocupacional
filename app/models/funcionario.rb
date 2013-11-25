class Funcionario < ActiveRecord::Base
  self.primary_key = :id
 
  attr_accessible :id, :empresa_id, :nome, :rg, :matricula
  belongs_to :empresa
  has_many :consultas, dependent: :destroy

end
