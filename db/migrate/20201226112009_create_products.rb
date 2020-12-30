class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :model, null: false, foreign_key: true
      t.references :memory, null: false, foreign_key: true
      t.references :color, null: false, foreign_key: true
      t.references :branch, null: false, foreign_key: true
      t.text :description
      t.references :status, null: false, foreign_key: true
      t.integer :price, null: false
      t.string :imei, null: false
      t.string :serial_number, null: false
      t.references :employee, null: false, foreign_key: true
      t.boolean :available, :default => true
      t.boolean :sold, :default => false

      t.timestamps null: false
    end
  end
end
