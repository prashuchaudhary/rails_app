class CreateSubSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_sub_categories do |t|
      t.boolean :valid
      t.string :name, limit: 500
      t.timestamp :rowLastUpdated
      t.integer :sub_category_id
      t.integer :scaleId
      t.integer :maxClubQty
      t.integer :isHygienic

      t.timestamps
    end
  end
end
