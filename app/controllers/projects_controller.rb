class ProjectsController < ApplicationController
	before_action :get_username

	def show
		@repos = UserGithub.get_repos_details (@username)
	end

	def create
		project = Project.new
		project.repo_id = params[:repo_id]
		project.name = params[:name]
		project.description = params[:description]
		project.url = params[:url]
		project.owner = @username
		project.readme = Base64.decode64 project.get_readme['content']

		project.save!

		respond_to do |format|
	        format.html { redirect_to projects_path}
	  	end
	end

	def destroy
		project = Project.where('repo_id = ?', params[:repo_id])
		Project.destroy(project.first.id)

		respond_to do |format|
	        format.html { redirect_to projects_path}
	  	end
	end

	def all_projects
		if params.has_key? :search
			@repos = Project.where("name LIKE ?", "%#{params[:search]}%")
		else
			@repos = Project.all
		end

		respond_to do |format|
	        format.html
	        format.js
	  	end
	end



	private
    def get_username
    	begin
    		@username = session[:github_current_user]['login']
    	rescue
    		redirect_to root_path
    	end
    end
end