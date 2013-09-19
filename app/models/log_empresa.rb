class LogEmpresa < ActiveRecord::Base
  attr_accessible :empresa_id, :mensagem

  belongs_to :empresa
end
