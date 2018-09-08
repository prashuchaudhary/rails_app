class Catalog < ApplicationRecord
	has_many :products
	belongs_to :sub_sub_category
	belongs_to :catalog_trend
end
