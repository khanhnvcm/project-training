class CreateBranches < ActiveRecord::Migration[6.0]
  def change
    create_table :branches do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.text :address, null: false
      t.string :phone, null: false
      t.string :email, null: false

      t.timestamps null: false
    end

    add_index :branches, %i[name email], unique: true
  end
end
