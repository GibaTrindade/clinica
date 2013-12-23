class Anamnese < ActiveRecord::Base
  belongs_to :paciente
  
  validates_presence_of :queixa
end
