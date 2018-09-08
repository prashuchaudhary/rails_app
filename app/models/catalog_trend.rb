class CatalogTrend < ApplicationRecord
	has_many :catalogs, :dependent => :destroy
end
