class AddIncomeToOperations < ActiveRecord::Migration[7.0]
  def change
    add_column :operations, :income, :boolean, default: false
  end
end
