class AddForeignKeyToComments < ActiveRecord::Migration
  def change
    add_column :comments, :idea_id, :integer
    add_index :comments, :idea_id
  end
end
