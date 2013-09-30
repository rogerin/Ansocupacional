class Empresa < ActiveRecord::Base
  attr_accessible :nome, :cnpj, :email, :login, :password, :password_confirmation, :password_digest, :user_id, :status


  has_secure_password

  belongs_to :user
  has_many :funcionarios, dependent: :destroy
  has_many :consultas, dependent: :destroy
  has_many :log_empresas, dependent: :destroy



  validates :nome, :email, :login, presence: true
  
  validates :password, :presence =>true,
                    :length => { :minimum => 3, :maximum => 40 }

  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, :message => "incorreto" }

  

  validates_uniqueness_of :cnpj, message: " - CNPJ Ja cadastrado"
  validates_uniqueness_of :email, message: " - E-mail Ja cadastrado"
  validates_uniqueness_of :login, message: " - Login Ja cadastrado"


	def self.login(login,password)
		find_by_login(login).try(:authenticate, password)
	end
end
