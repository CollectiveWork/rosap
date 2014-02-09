class UserGithub  < ActiveRecord::Base
  include HTTParty

  headers "User-Agent" => "Rosap"


  def get_user_details
    url = 'https://api.github.com/user'
    headers = {"User-Agent" => "Rosap"}

    post_body = {:scopes => ["user"]}
    response = self.class.post url, {
      :body => post_body.to_json,
      :basic_auth => {
        :username => self.username,
        :password => self.password
      }
    }

    response.parsed_response
  end

  def self.get_repos_details(username)
    url_link = "https://api.github.com/users/#{username}/repos"
    headers = {"User-Agent" => "Rosap"}

    repos = HTTParty.get(url_link, headers: headers)
  end
  
end