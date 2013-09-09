class Categoria < ActiveRecord::Base
  attr_accessible :nome
  has_many :exames

  validates :nome, presence: true

end
