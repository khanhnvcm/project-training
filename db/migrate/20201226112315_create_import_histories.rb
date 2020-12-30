class CreateImportHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :import_histories do |t|
      t.references :product, null: false, foreign_key: true
      t.references :branch, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
