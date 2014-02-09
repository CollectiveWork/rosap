class AddIndexToProjects < ActiveRecord::Migration
  def change
  	add_index :projects, :repo_id, :unique => true
  end
end
