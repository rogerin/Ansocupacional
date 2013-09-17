class Asset < ActiveRecord::Base
  attr_accessible :consulta_id, :asset,:assets, :categoria_id, :asset_updated_at, :asset_file_name, :asset_content_type, :asset_file_size, :data
  attr_accessor :basename

  belongs_to :consulta
  belongs_to :categoria

  has_attached_file :asset, :path => "public/exames/:id/:filename",
  							:url => "/exames/:id/:basename.:extension"

  	before_save :basename
	private

	def basename
		@funcionario = Funcionario.find(consulta.funcionario_id)
		extension = File.extname(asset_file_name).downcase
		self.asset_file_name = "#{@funcionario.nome}-#{@funcionario.rg}-#{@funcionario.matricula}-#{Time.now.to_i}#{extension}"
	end



  scope :por_categoria, lambda{ |c| where("categoria_id = ?", c) }    
end

