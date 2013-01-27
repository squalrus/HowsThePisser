HowsThePisser.controllers do

	get "/search" do
		protected!

		access_token = OAuth2::AccessToken.new(client, current_user.foursquare_access_token)

		response = access_token.get("https://api.foursquare.com/v2/venues/search?near=Milwaukee,WI&#{v_param}")
		@venues = response['response']['venues']

		render :results
	end

end