class Empresa < ActiveRecord::Base
  attr_accessible :cnpj, :email, :login, :nome, :password, :password_confirmation, :password_digest, :user_id
  has_secure_password
  belongs_to :user
  has_many :funcionarios
  has_many :exames
  has_many :consultas


  validates :email, :login, :nome, :password, :password_confirmation, presence: true
  validates :password, confirmation: true

  validates_uniqueness_of :cnpj, message: " - CNPJ Ja cadastrado"
  validates_uniqueness_of :email, message: " - E-mail Ja cadastrado"
  validates_uniqueness_of :login, message: " - Login Ja cadastrado"


	def self.login(login,password)
		find_by_login(login).try(:authenticate, password)
	end
end
