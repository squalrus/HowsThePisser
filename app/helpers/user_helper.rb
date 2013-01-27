HowsThePisser.helpers do
	helpers Shield::Helpers
	
	#Returns the current user if authenicated
	def current_user
		authenticated(User)
	end
	
	#Checks to see if the current user is logged in.
	def is_logged_in?
		!! current_user
	end

	def protected!
        unless is_logged_in?
        	redirect "/"
        end
    end

end