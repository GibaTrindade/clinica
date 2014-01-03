class Diagnostico < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :user
  
  validates_presence_of :nome, :cid
end
