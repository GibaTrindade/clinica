class Paciente < ActiveRecord::Base
  has_many :diagnosticos
  has_many :exames
  
  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
    validates_presence_of :nome, :cpf, :sexo
    #validates_confirmation_of :password
    validates_length_of :cpf, is: 11, allow_blank: false
    validates_uniqueness_of :cpf
    
    
    #validate do
    #    errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
    #end
end
