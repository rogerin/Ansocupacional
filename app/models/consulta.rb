class Consulta < ActiveRecord::Base
  attr_accessible :funcionario_id, :empresa_id, :asset, :assets_attributes, :categoria_id, :funcionario_id
  belongs_to :funcionario
  belongs_to :empresa

  has_many :assets


  accepts_nested_attributes_for :assets, :reject_if => proc { |attributes| attributes['asset'].blank? }, :allow_destroy => true

end
