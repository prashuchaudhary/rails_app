require 'elasticsearch_repo/product'

class Product < ApplicationRecord
	belongs_to :catalog

	def index_to_es
		product_repo = ::ElasticsearchRepo::Product.new(client: Elasticsearch::Model.client)
		product_repo.save self
	end

end
