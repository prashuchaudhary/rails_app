class CreateCatalogs < ActiveRecord::Migration[5.2]
  def change
    create_table :catalogs do |t|
      t.boolean :valid
      t.string :name, limit: 1000
      t.integer :minCatalogPrice
      t.integer :minProductPrice
      t.integer :minShippingCharges
      t.string :description, limit: 4000
      t.string :detail, limit: 1000
      t.string :shareText, limit: 1000
      t.boolean :hot
      t.integer :preBooking
      t.integer :priority
      t.boolean :popularPriority
      t.interger :numSuppliers
      t.integer :numProducts
      t.interger :category_id
      t.integer :catalog_trend_id
      t.string :image, limit: 1000
      t.string :image128, limit: 1000
      t.string :image256, limit: 1000
      t.string :image512, limit: 1000
      t.string :storyImage, limit: 1000
      t.string :storyImage256, limit: 1000
      t.string :storyImage512, limit: 1000
      t.string :storyImage128, limit: 1000
      t.integer :imageCounter
      t.timestamp :created
      t.timestamp :activated
      t.string :type, limit: 255
      t.boolean :popular
      t.string :bitLyUrl, limit: 50
      t.string :branchUrl, limit: 100
      t.string :bitLyUrlWhatsapp, limit: 50
      t.string :branchUrlWhatsapp, limit: 100
      t.decimal10 :maxDiscountPercent
      t.decimal2 :maxDiscountPercent
      t.interger :hasProductMrp
      t.integer :catalogOrganizeId
      t.integer :audienceId
      t.integer :oldCategoryId
      t.boolean :enableRating
      t.timestamp :rowLastUpdated

      t.timestamps
    end
  end
end
