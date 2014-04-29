class AddCompletedToSwap < ActiveRecord::Migration
  def change
    add_column :swaps, :completed, :boolean
  end
end
