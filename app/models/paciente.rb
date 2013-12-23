class Paciente < ActiveRecord::Base
  has_many :diagnosticos
  has_many :exames
  has_many :anamneses
  
  
  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
    validates_presence_of :nome, :cpf, :sexo
    #validates_confirmation_of :password
    validates_length_of :cpf, is: 11, allow_blank: false
    validates_uniqueness_of :cpf
    validates :email, format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }, :allow_blank => true
    
    #validate do
    #    errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
    #end
end
