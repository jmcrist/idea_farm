class DropTypeFromIdeas < ActiveRecord::Migration
  def change
    remove_column :ideas, :type

    add_column :ideas, :product_type, :string
  end
end
