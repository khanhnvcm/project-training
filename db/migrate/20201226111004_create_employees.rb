class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :position, null: false
      t.date :birthday, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.text :address, null: false
      t.references :branch, null: false, foreign_key: true

      t.timestamps null: false
    end
    
    add_index :employees, :email, unique: true
  end
end
