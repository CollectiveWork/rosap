class PostStoryController < ApplicationController

 def auth
 
     cookies["title"] = { :value => "#{params[:title]}", :expires => 1.minute.from_now }
     cookies["url"] = { :value => "#{params[:url]}", :expires => 1.minute.from_now }
     cookies["desc"] = { :value => "#{params[:desc]}", :expires => 1.minute.from_now }

     cookies["message"] = { :value => "#{params[:message]}", :expires => 1.minute.from_now }
     cookies["picture"] = { :value => "#{params[:picture]}", :expires => 1.minute.from_now }
     cookies["link"] = { :value => "#{params[:link]}", :expires => 1.minute.from_now }
     cookies["name"] = { :value => "#{params[:name]}", :expires => 1.minute.from_now }
     cookies["description"] = { :value => "#{params[:description]}", :expires => 1.minute.from_now }
    
  @client = client
 
    redirect_to @client.authorization_uri(
      :scope => [ :offline_access , :publish_stream]
    )
 
  end
 
 
  def callback

    @client = client
    @client.authorization_code = params[:code]
 
    access_token = @client.access_token! :client_auth_body # => Rack::OAuth2::AccessToken
 
    me = FbGraph::User.me(access_token)
 
    title = cookies["title"]
    url = cookies["url"]
    desc  = cookies["desc"]
 
    me.feed!(
	  :message => cookies["message"],
	  :picture => cookies["picture"],
	  :link => cookies["link"],
	  :name => cookies["name"],
	  :description => cookies["description"]
	) 
 
    redirect_to all_projects_path, notice: {message: "The project was succesfully posted on your wall", type: "success"}
 
  end
 
 
  private
 
 
  def client
 
    key = '241654275999158'
    secret = '42eadee11413ad98a2992e08976f7cd5'
    fb_auth = FbGraph::Auth.new(key, secret)
    client = fb_auth.client
    client.redirect_uri = "http://#{request.host_with_port}/post_story/callback"
 
    client
 
  end
 
end
