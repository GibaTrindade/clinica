class Paciente < ActiveRecord::Base
  #attr_accessible :nome
  has_many :diagnosticos, dependent: :destroy
  has_many :exames, dependent: :destroy
  has_many :anamneses, dependent: :destroy
  belongs_to :user
  
  
  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
    validates_presence_of :nome, :cpf, :sexo
    #validates_confirmation_of :password
    validates_length_of :cpf, is: 11, allow_blank: false
    validates_uniqueness_of :cpf
    validates :email, format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }, :allow_blank => true
    
    #validate do
    #    errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
    #end
    def self.search(search)
        if search
          where('nome LIKE ?', "%#{search}%")
        else
          scoped
        end
      end
end
