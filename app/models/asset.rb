#encoding: utf-8
class Asset < ActiveRecord::Base
  attr_accessible :id, :consulta_id, :asset,:assets, :categoria_id, :asset_updated_at, :asset_file_name, :asset_content_type, :asset_file_size, :data
  attr_accessor :basename

  belongs_to :consulta
  belongs_to :categoria

  before_save :check_done

  has_attached_file :asset, :path => "public/exames/:id/:filename",
  							:url => "/exames/:id/:basename.:extension"

  before_save :basename
	private
	def basename
    require 'securerandom'
    require 'extend_string'
		@funcionario = Funcionario.find(consulta.funcionario_id)
		extension = File.extname(asset_file_name).downcase
		self.asset_file_name = "#{@funcionario.empresa.nome.removeaccents}-#{@funcionario.rg}_#{@funcionario.nome.removeaccents}-#{SecureRandom.hex}-#{Time.now.to_i}#{extension}"
	end

  private
  def check_done
    if categoria_id.nil?
      self.categoria_id = 1
    end
    if data.nil?
      self.data = Time.now.strftime("%Y-%m-%d")
    end
  end


  scope :por_categoria, lambda{ |c| where("categoria_id = ?", c) }    
end

