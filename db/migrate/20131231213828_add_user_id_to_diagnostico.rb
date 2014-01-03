class AddUserIdToDiagnostico < ActiveRecord::Migration
  def change
    add_column :diagnosticos, :user_id, :integer
    add_index :diagnosticos, :user_id
  end
end
