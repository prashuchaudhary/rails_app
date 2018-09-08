class SubSubCategory < ApplicationRecord
	belongs_to :sub_categories
	has_many :catalogs, :dependent => :destroy
end
