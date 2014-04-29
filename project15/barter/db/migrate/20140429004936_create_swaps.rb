class CreateSwaps < ActiveRecord::Migration
  def change
    create_table :swaps do |t|
      t.integer :item1
      t.string :name
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
