HowsThePisser.controllers do

	get "/search" do
		protected!

		near = params[:near]
		if near.nil? || near == ""
			near = "Milwaukee,WI"
		end

		access_token = OAuth2::AccessToken.new(client, current_user.foursquare_access_token)

		response = access_token.get("https://api.foursquare.com/v2/venues/search?near=#{near}&#{v_param}")
		@venues = response['response']['venues']

		render :results
	end

end