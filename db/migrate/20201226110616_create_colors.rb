class CreateColors < ActiveRecord::Migration[6.0]
  def change
    create_table :colors do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    
    add_index :colors, :name, unique: true
  end
end
