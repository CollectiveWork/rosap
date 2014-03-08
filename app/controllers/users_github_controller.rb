class UsersGithubController < ApplicationController
	def login
		# Use Basic Auth to get a token
		@client = UserGithub.new
	end

	def make_login
		client = UserGithub.new(client_params)
		@response = client.get_user_details
		puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
		puts @response.inspect

		respond_to do |format|
			if @response['message'] == "Bad credentials"
				format.html { redirect_to github_login_path, notice: {message: "Bad credentials.", type: "danger"} }
			else
				session[:github_current_user] = @response
	        	format.html { redirect_to projects_path}
	        end
	  	end
	end

	def index
	end

	def show
	end

	def destroy
		session[:github_current_user] = nil
		redirect_to root_path
	end

private
	def client_params
      params.require(:user_github).permit(:username, :password)
    end
end