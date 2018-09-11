module CatalogSearchable
	extend ActiveSupport::Concern

	included do
		include Elasticsearch::Model
		include Elasticsearch::Model::Callbacks

		# Dynamic mapping allows new field names to be added automatically added to ES, just by indexing a document.
		# New fields can be added both to the top-level mapping type, and to inner object and nested fields.

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
				indexes :activated, 				type: 'date' do
				 	format: "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis"
				end
				indexes :products, type: 'nested' do
					indexes :id,							type: "long"
					indexes :name,						analyzer:"indexing_analyzer", search_analyzer: "search_analyze"
					indexes :description,			analyzer:"indexing_analyzer", search_analyzer: "search_analyze"
					indexes :weight, 					type: "float"
					indexes :sku,
					indexes
				end
				indexes :catalog_trend, type: 'nested' do
					indexes :name
				end
				indexes :sub_sub_category, type: 'nested' do
					indexes :name
					indexes :sub_category_id,  type: "long"
				end
			end
		end

		def as_indexed_json(options={})
			self.as_json(
				include: {
					catalogs: { only: [:id, :name, :description, :detail, :shareText, :image512, :activated]},
					products: { only: [:id, :name, :weight, :sku] }
					catalog_trend: { only: [:full_name] },
					sub_sub_category: { only: :text }
				}
			)
		end
	end
end
