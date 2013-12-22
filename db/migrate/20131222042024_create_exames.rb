class CreateExames < ActiveRecord::Migration
  def change
    create_table :exames do |t|
      t.string :nome
      t.float :resultado
      t.string :unidade
      t.references :paciente, index: true

      t.timestamps
    end
  end
end
