module ElasticSearch
	class RecordNotFound < StandardError
	end

	class ServerNotWorking < StandardError
		def message
			"ElasticSearch Server is down"
		end
	end

	class MissingArguments < StandardError
		def message
			"Provide proper arguments for searching in ElasticSearch"
		end
	end
end
