HowsThePisser.controllers do

	get "/venue/:id/pisser" do
		protected!

		access_token = OAuth2::AccessToken.new(client, current_user.foursquare_access_token)

		response = access_token.get("https://api.foursquare.com/v2/venues/#{params[:id]}?#{v_param}")
		@venue = response['response']['venue']

		@pissers = Pisser.filter(:venue_id => params[:id]).all

		render :venue
	end

	post "/venue/:id/pisser" do
		protected!

		if params[:name] != nil && params[:name] != ""
			Pisser.create(:name => params[:name], :venue_id => params[:id], :user => current_user)
		end

		redirect "/venue/#{params[:id]}/pisser"
	end

	get "/venue/:id/pisser/:pisser_id/:rating" do
		protected!

		pisser = Pisser[params[:pisser_id].to_i]
		unless pisser
			logger.debug "Count not find pisser"
			redirect "/venue/#{params[:id]}/pisser"
		end

		rating = params[:rating].to_i
		if rating > 5
			rating = 5
		elsif rating < 1
			rating = 1
		end

		pisser_rating = PisserRating.filter(:pisser => pisser, :user => current_user).first
		if pisser_rating
			pisser_rating.rating = rating
			pisser_rating.save
		else
			pisser_rating = PisserRating.create(:pisser => pisser, :user => current_user, :rating => 4)
		end

		redirect "/venue/#{params[:id]}/pisser"
	end

end