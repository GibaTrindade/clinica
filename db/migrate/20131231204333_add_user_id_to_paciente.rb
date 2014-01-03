class AddUserIdToPaciente < ActiveRecord::Migration
  def change
    add_column :pacientes, :user_id, :integer
    add_index :pacientes, :user_id
  end
end
