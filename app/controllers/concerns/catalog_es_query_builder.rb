require 'jbuilder'
require 'elasticsearch/dsl'

module CatalogSearchable
	extend ActiveSupport::Concern

	included do
		include Elasticsearch::DSL

		def catalog_query
			query = Jbuilder.encode do |json|
				json.query do
					json.match do
						json.title do
							json.query    'sly fox'
							json.operator 'and'
						end
					end
				end
			end

		def catalog_query_dsl
			query = Elasticsearch::DSL::Search.search do
				query do
					match :title do
						query 'fox sly'
					end
				end
			end
		end

	end

end

