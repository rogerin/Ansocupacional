class Funcionario < ActiveRecord::Base
  attr_accessible :empresa_id, :nome, :rg
  belongs_to :empresa
  has_many :exames
  has_many :consultas


  validates :empresa_id, :nome, :rg,  presence: true
  

end
