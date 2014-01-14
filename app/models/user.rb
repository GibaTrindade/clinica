class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
  
  ROLES = %w[administrador associado secretaria]
  
  def role_enum
      # Do not select any value, or add any blank field. RailsAdmin will do it for you.
      ['administrador', 'associado', 'secretaria']
    end
end
