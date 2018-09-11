require 'base64'

module ElasticsearchRepo
	class Catalog
		extend ActiveSupport::Concern

		include Elasticsearch::Model
		include Elasticsearch::Model::Callbacks
		include Elasticsearch::Persistence::Repository
		include Elasticsearch::Persistence::Repository::DSL

		index_name 'catalogs'
		document_type 'catalog'
		klass Catalog

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
				indexes :id,								type: "long"
				indexes :name,							analyzer:"indexing_analyzer", search_analyzer: "search_analyze"
				indexes :description,				analyzer:"indexing_analyzer", search_analyzer: "search_analyze"
				indexes :detail,						analyzer:"indexing_analyzer", search_analyzer: "search_analyze"
				indexes :shareText,					analyzer:"indexing_analyzer", search_analyzer: "search_analyze"
				indexes :image512, 					type: 'url'
				indexes :activated, 				type: 'date', format: "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis"
				indexes :products, type: 'nested' do
					indexes :id,							type: "long"
					indexes :name,						analyzer:"indexing_analyzer", search_analyzer: "search_analyze"
					indexes :description,			analyzer:"indexing_analyzer", search_analyzer: "search_analyze"
					indexes :weight, 					type: "float"
					indexes :sku
				end
				indexes :catalog_trend, type: 'nested' do
					indexes :name
				end
				indexes :sub_sub_category, type: 'nested' do
					indexes :name
				end
			end
		end

		def serialize(record)
			record.as_json(
				only: [:id, :name, :description, :detail, :shareText, :image512, :activated],
				:include =>
				{
					:products => { only: [:id, :name, :weight, :sku] },
					catalog_trend: { only: :name},
					sub_sub_category: {only: :name}
				}
			)
		end
		# Base64 decode the "image" field in the document
		#
		def deserialize(document)
			hash = document['_source']
			hash['image512'] = Base64.decode64(hash['image512']) if hash['image512']
			klass.new hash
		end
	end # Class Catalog
end # Module ElasticsearchRepo
