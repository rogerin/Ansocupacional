class Exame < ActiveRecord::Base
  attr_accessible :categoria_id, :funcionario_id, :empresa_id, :link
  belongs_to :funcionario
  belongs_to :categoria
  belongs_to :empresa

  validates :categoria_id, :funcionario_id, :empresa_id, :link, presence: true
 


	def self.save(upload,funcionario_id)
      @funcionario = Funcionario.find_by_id(funcionario_id)
      time = Time.new
    	name =  @funcionario.rg + time.strftime("%Y%m%d%H%M%S") + upload.original_filename
    	directory = "public/data"
    	# create the file path
    	path = File.join(directory, name)
    	# write the file
    	File.open(path, "wb") { |f| f.write(upload.read) }
      name
  	end
end
