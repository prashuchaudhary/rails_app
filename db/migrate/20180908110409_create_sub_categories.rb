class CreateSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_categories do |t|
      t.boolean :valid
      t.string :name, limit: 500
      t.timestamp :rowLastUpdated
      t.integer :category_id

      t.timestamps
    end
  end
end
