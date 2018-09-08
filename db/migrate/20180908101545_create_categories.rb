class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.boolean :valid
      t.string :name, limit: 500
      t.timestamp :rowLastUpdated

      t.timestamps
    end
  end
end
