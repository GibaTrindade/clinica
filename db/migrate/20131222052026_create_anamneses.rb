class CreateAnamneses < ActiveRecord::Migration
  def change
    create_table :anamneses do |t|
      t.text :queixa
      t.references :paciente, index: true

      t.timestamps
    end
  end
end
