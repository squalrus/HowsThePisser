HowsThePisser.controllers do

	get "/" do
		render :index
	end

	get "/foursquare" do
		redirect client.web_server.authorize_url(:redirect_uri => redirect_uri)
	end

	get '/auth/foursquare/callback' do
		# access_token = client.web_server.get_access_token(params[:code], :redirect_uri => redirect_uri)
		# It would be better to use the line above but it returns a 301 error, so I use the hack below instead.

		# start hack
		uri = URI.parse("https://foursquare.com/oauth2/access_token?client_id=#{ENV['FOURSQUARE_CLIENT_ID']}&client_secret=#{ENV['FOURSQUARE_CLIENT_SECRET']}&grant_type=authorization_code&redirect_uri=#{redirect_uri}&code=" + params[:code])
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Get.new(uri.request_uri)
		response = JSON.parse(http.request(request).body)
		access_token = OAuth2::AccessToken.new(client, response["access_token"])
		# end hack

		# some user data as an example
		user = access_token.get('https://api.foursquare.com/v2/users/self')
		user.inspect
	end

end