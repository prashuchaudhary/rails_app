require 'base64'

module ElasticsearchRepo
	class Product
		extend ActiveSupport::Concern

		include Elasticsearch::Model
		include Elasticsearch::Model::Callbacks
		include Elasticsearch::Persistence::Repository
		include Elasticsearch::Persistence::Repository::DSL

		index_name 'products'
		document_type 'product'
		klass Product

		settings index: {
			analysis: {
				analyzer: {
					 indexing_analyzer: {
						 :tokenizer => "whitespace",
						 :filter =>  ["lowercase", "ngram_filter_20"]
					 },
					indexing_analyzer_more: {
						:tokenizer => "whitespace",
						:filter =>  ["lowercase", "ngram_filter"]
					 },
					 search_analyze: {
						 :tokenizer => "whitespace",
						 :filter =>  "lowercase"
					 }
				},
				filter: {
					ngram_filter_20: {
						type: "nGram",
						min_gram: 3,
						max_gram: 20
					},
					ngram_filter: {
						type: "nGram",
						min_gram: 3,
						max_gram: 50
					}
				}
			}
		} do
			mappings dynamic: 'false' do
				indexes :id,							type: "long"
				indexes :name,						analyzer:"indexing_analyzer", search_analyzer: "search_analyze"
				indexes :description,			analyzer:"indexing_analyzer", search_analyzer: "search_analyze"
				indexes :weight, 					type: "float"
				indexes :sku
			end
		end

		def serialize(record)
			record.as_json(
				only: [:id, :name, :weight, :sku, :description],
			)
		end

		def deserialize(document)
			hash = document['_source']
			klass.new hash
		end
	end
end