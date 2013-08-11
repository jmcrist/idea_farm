class AddFlagToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :flag, :boolean
    add_index :ideas, :flag
  end
end
