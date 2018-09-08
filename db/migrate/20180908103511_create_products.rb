class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.boolean :valid
      t.string :name, limit: 1000
      t.string :description, limit: 2000
      t.integer :catalog_id
      t.boolean :fullCatalog
      t.integer :weight
      t.string :sku, limit: 100
      t.string :images, limit: 1000
      t.string :images128, limit: 1000
      t.string :images512, limit: 1000
      t.integer :imageCounter
      t.timestamp :created
      t.integer :mrpPrice
      t.timestamp :rowLastUpdated

      t.timestamps
    end
  end
end
