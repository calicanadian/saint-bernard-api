class CreateOrderFrequencies < ActiveRecord::Migration[5.2]
  def change
    create_table :order_frequencies do |t|
      t.string :value
      t.integer :unit, default: 0

      t.timestamps
    end
  end
end
