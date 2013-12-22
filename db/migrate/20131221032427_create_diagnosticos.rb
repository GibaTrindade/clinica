class CreateDiagnosticos < ActiveRecord::Migration
  def change
    create_table :diagnosticos do |t|
      t.string :nome
      t.string :cid
      t.boolean :estado
      t.references :paciente, index: true

      t.timestamps
    end
  end
end
