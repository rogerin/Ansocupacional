class Exame < ActiveRecord::Base
  attr_accessible :categoria_id, :funcionario_id,:empresa_id, :link
  belongs_to :funcionario
  belongs_to :categoria

	def self.save(upload)
    	name =  upload.original_filename
    	directory = "public/data"
    	# create the file path
    	path = File.join(directory, name)
    	# write the file
    	File.open(path, "wb") { |f| f.write(upload.read) }
      name
  	end
end
