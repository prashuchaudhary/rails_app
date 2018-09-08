class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.string :name, limit: 500
      t.integer :priority
      t.string :image, limit: 1000
      t.string :image128, limit: 1000
      t.string :image256, limit: 1000
      t.string :image512, limit: 1000
      t.integer :imageCounter
      t.boolean :valid
      t.timestamp :activated
      t.timestamp :rowLastUpdated

      t.timestamps
    end
  end
end
