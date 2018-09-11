require 'base64'

module ElasticsearchRepo
	class CatalogDoc

		include Elasticsearch::Persistence::Repository
		include Elasticsearch::Persistence::Repository::DSL

		index_name 'catalogs'
		document_type 'catalog'
		klass Catalog

		settings number_of_shards: 1 do
			mapping do
				indexes :name,  analyzer: 'snowball'
				# Do not index images
				indexes :image512, index: false
			end
		end

		# Base64 encode the "image512" field in the document
		#
		def serialize(document)
			hash = document.to_hash.clone
			hash['image512'] = Base64.encode64(hash['image512']) if hash['image512']
			hash.to_hash
		end

		# Base64 decode the "image" field in the document
		#
		def deserialize(document)
			hash = document['_source']
			hash['image512'] = Base64.decode64(hash['image512']) if hash['image512']
			klass.new hash
		end

	end
end