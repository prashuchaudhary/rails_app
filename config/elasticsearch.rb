Elasticsearch::Model.client = Elasticsearch::Client.new host: Rails.configuration.elastic_host, reload_connections: true, transport_options: {
	request: {
		open_timeout: ENV['ES_OPEN_TIMEOUT'].to_f == 0 ? ELASTICSEARCH_FARADAY_OPEN_TIME_OUT : ENV['ES_OPEN_TIMEOUT'].to_f,
		timeout: ENV['ES_REQ_TIMEOUT'].to_f == 0 ? ELASTICSEARCH_FARADAY_REQUEST_TIMEOUT : ENV['ES_REQ_TIMEOUT'].to_f
	}
}