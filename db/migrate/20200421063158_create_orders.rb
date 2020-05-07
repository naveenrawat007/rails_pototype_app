class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :bus_date
      t.time :hour
      t.string :name
      t.string :phone
      t.string :address
      t.string :address1
      t.string :city
      t.string :state
      t.string :zip
      t.float :subtotal
      t.float :taxes
      t.float :total
      t.timestamps
    end
  end
end
