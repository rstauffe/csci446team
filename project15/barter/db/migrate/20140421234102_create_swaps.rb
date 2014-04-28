class CreateSwaps < ActiveRecord::Migration
  def change
    create_table :swaps do |t|
      t.string :orig_name
      t.text :orig_desc
      t.string :orig_image
      t.string :swap_name
      t.text :swap_desc
      t.string :swap_image
      t.datetime :time

      t.timestamps
    end
  end
end
