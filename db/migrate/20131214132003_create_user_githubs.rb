class CreateUserGithubs < ActiveRecord::Migration
  def change
    create_table :user_githubs do |t|
    	t.string :username, :null => false
      t.string :password, :null => false

      t.timestamp
    end
  end
end
