class Exame < ActiveRecord::Base
  belongs_to :paciente
  
  validates_presence_of :nome, :resultado, :unidade
end
