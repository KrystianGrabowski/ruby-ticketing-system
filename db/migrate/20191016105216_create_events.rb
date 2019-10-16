class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :date
      t.integer :available_tickets
      t.integer :price

      t.timestamps
    end
  end
end
