class User < ActiveRecord::Base
  attr_accessible :email, :login, :nome, :password, :password_confirmation, :password_digest, :tipo, :link
  has_secure_password
  has_many :empresas

	def self.login(login,password)
		find_by_login(login).try(:authenticate, password)
	end

	def self.save(upload)
      	time = Time.new
    	name =  time.strftime("%Y%m%d%H%M%S") + upload.original_filename
    	directory = "public/clinica"
    	# create the file path
    	path = File.join(directory, name)
    	# write the file
    	File.open(path, "wb") { |f| f.write(upload.read) }
      name
  	end

end
