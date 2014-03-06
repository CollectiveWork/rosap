class AddReadmeForProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :readme, :string
  end
end
