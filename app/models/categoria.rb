class Categoria < ActiveRecord::Base
  attr_accessible :nome
  has_many :assets, dependent: :destroy

  validates :nome, presence: true
  validates_uniqueness_of :nome, message: " - ja cadastrado"

end
