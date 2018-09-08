class SubCategory < ApplicationRecord
	has_many :sub_sub_categories
	belongs_to :category
end
