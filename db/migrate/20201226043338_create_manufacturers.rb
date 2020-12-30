class CreateManufacturers < ActiveRecord::Migration[6.0]
  def change
    create_table :manufacturers do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    
    add_index :manufacturers, :name, unique: true
  end
end
