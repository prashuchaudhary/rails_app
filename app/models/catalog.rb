require 'elasticsearch_repo/catalog'

class Catalog < ApplicationRecord

	has_many :products
	belongs_to :sub_sub_category
	belongs_to :catalog_trend

	def index_to_es
		catalog_repo = ::ElasticsearchRepo::Catalog.new(client: Elasticsearch::Model.client)
		catalog_repo.save self
	end

end
