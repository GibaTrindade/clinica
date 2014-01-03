class AddUserIdToExame < ActiveRecord::Migration
  def change
    add_column :exames, :user_id, :integer
    add_index :exames, :user_id
  end
end
