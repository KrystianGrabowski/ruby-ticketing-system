class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
