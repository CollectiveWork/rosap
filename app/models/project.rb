class Project < ActiveRecord::Base  
	include HTTParty

	def get_readme 
		url_link = "https://api.github.com/repos/#{owner}/#{name}/readme"
		puts url_link
		header = {"User-Agent" => "Rosap"}
		readme = HTTParty.get(url_link, headers: header)
		
  	end
end