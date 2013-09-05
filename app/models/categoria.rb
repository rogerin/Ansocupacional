class Categoria < ActiveRecord::Base
  attr_accessible :nome
  has_many :exames

end
