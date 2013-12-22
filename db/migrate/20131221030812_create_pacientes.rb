class CreatePacientes < ActiveRecord::Migration
  def change
    create_table :pacientes do |t|
      t.string :nome
      t.string :cpf
      t.string :email
      t.integer :idade
      t.string :sexo
      t.string :telf
      t.string :telc
      t.string :convenio
      t.boolean :ativo
      t.string :estadocivil
      
      t.index :cpf, unique: true

      t.timestamps
    end
  end
end
