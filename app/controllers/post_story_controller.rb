class PostStoryController < ApplicationController
  def postme

  	app = FbGraph::Application.new('241654275999158', :secret => '42eadee11413ad98a2992e08976f7cd5')
	aCCESS_TOKEN = app.get_access_token



  	me = FbGraph::User.me(aCCESS_TOKEN)

	me.feed!(
	  :message => 'Updating via FbGraph',
	  :picture => 'https://graph.facebook.com/codrut.gusoi/picture',
	  :link => 'https://github.com/nov/fb_graph',
	  :name => 'FbGraph',
	  :description => 'A Ruby wrapper for Facebook Graph API'
	)
	redirect_to root_path

  end

end