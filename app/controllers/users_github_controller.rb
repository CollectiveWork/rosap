class UsersGithubController < ActionController::Base
	def login
		# Use Basic Auth to get a token
		@client = UserGithub.new
	end

	def make_login
		client = UserGithub.new(client_params)
		@response = client.get_user_details
		Rosap::Application.set_github_current_user @response


		#redirect_to github_login_path
	end

	def client_params
      params.require(:user_github).permit(:username, :password)
    end
end