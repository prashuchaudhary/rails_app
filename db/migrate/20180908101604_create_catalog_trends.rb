class CreateCatalogTrends < ActiveRecord::Migration[5.2]
  def change
    create_table :catalog_trends do |t|
      t.string :name, limit: 500
      t.timestamp :rowLastUpdated

      t.timestamps
    end
  end
end
