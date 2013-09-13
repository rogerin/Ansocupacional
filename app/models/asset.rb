class Asset < ActiveRecord::Base
  attr_accessible :consulta_id, :asset,:assets, :categoria_id, :asset_updated_at, :asset_file_name, :asset_content_type, :asset_file_size
	

  belongs_to :consulta
  belongs_to :categoria

  has_attached_file :asset
  
end
