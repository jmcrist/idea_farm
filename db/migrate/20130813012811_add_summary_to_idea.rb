class AddSummaryToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :type, :string
    add_column :ideas, :market, :string
    add_column :ideas, :profit, :string
    add_column :ideas, :loe, :string
    add_column :ideas, :solves, :string
  end
end
