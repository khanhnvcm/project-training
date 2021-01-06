class CreateMemories < ActiveRecord::Migration[6.0]
  def change
    create_table :memories do |t|
      t.string :amount, null: false

      t.timestamps null: false
    end
    
    add_index :memories, :amount, unique: true
  end
end
