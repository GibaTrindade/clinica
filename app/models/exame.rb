class Exame < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :user
  
  validates_presence_of :nome, :resultado, :unidade
end
