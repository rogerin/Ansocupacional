class Funcionario < ActiveRecord::Base
  attr_accessible :empresa_id, :nome, :rg, :matricula
  belongs_to :empresa
  has_many :consultas, dependent: :destroy



  validates :empresa_id, :nome, :rg,  presence: true
  validates_uniqueness_of :rg, message: " - ja cadastrado"
  validates_uniqueness_of :matricula, message: " - ja cadastrada"

  
end
