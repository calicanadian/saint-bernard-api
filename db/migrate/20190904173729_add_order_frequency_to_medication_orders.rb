class AddOrderFrequencyToMedicationOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :medication_orders, :order_frequency_id, :integer
  end
end
