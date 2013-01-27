HowsThePisser.helpers do

	def client
		OAuth2::Client.new(ENV['FOURSQUARE_CLIENT_ID'], ENV['FOURSQUARE_CLIENT_SECRET'], 
			:site => 'http://foursquare.com/v2/',
			:request_token_path => "/oauth2/request_token",
			:access_token_path  => "/oauth2/access_token",
			:authorize_path     => "/oauth2/authenticate?response_type=code",
			:parse_json => true
		)
	end

	def redirect_uri()
		uri = URI.parse(request.url)
		uri.path = ENV['FOURSQUARE_CALLBACK_PATH']
		uri.query = nil
		uri.to_s
	end

end