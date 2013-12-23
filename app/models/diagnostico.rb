class Diagnostico < ActiveRecord::Base
  belongs_to :paciente
  
  validates_presence_of :nome, :cid
end
