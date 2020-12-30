class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :models do |t|
      t.string :name, null: false
      t.string :display, null: false
      t.string :camera, null: false
      t.string :battery, null: false
      t.text :detail
      t.references :manufacturer, null: false, foreign_key: true

      t.timestamps null: false
    end
    
    add_index :models, :name, unique: true
  end
end
