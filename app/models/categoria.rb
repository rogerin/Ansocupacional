class Categoria < ActiveRecord::Base
  attr_accessible :nome
  has_many :exames
  has_many :consultas
  has_many :assets



  validates :nome, presence: true
  validates_uniqueness_of :nome, message: " - ja cadastrado"

end
