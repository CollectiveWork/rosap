class CreateProjectsTable < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.integer :repo_id 
    	t.string :name
    	t.string :description
    	t.string :url

    	t.timestamp
    end
  end
end
