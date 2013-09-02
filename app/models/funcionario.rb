class Funcionario < ActiveRecord::Base
  attr_accessible :empresa_id, :nome, :rg
  belongs_to :empresa
  has_many :exames
end
