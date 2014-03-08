class ChangeReadmeType < ActiveRecord::Migration
  def up
  	change_column :projects, :readme,:text
  end

  def down
  	change_column :projects, :readme,:string
  end
end
