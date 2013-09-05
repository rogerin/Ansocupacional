class Exame < ActiveRecord::Base
  attr_accessible :categoria_id, :funcionario_id, :empresa_id, :link
  belongs_to :funcionario
  belongs_to :categoria
  belongs_to :empresa


	def self.save(upload,funcionario_id)
      @funcionario = Funcionario.find_by_id(funcionario_id)

    	name =  @funcionario.rg + upload.original_filename
    	directory = "public/data"
    	# create the file path
    	path = File.join(directory, name)
    	# write the file
    	File.open(path, "wb") { |f| f.write(upload.read) }
      name
  	end
end
