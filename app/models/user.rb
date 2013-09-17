class User < ActiveRecord::Base
  attr_accessible  :nome, :email, :login, :password, :password_confirmation, :tipo, :avatar, :status, :avatar_file_name
  has_attached_file :avatar, styles: {thumb: "140x50"}

  has_secure_password
  has_many :empresas, dependent: :destroy

  validates :nome, :email, :login, :password, :password_confirmation, :tipo, presence: true, :on => :create
  validates :password, confirmation: true, :on => :create

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
