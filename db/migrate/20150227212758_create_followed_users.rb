class CreateFollowedUsers < ActiveRecord::Migration
  def change
    create_table :followed_users do |t|
    t.integer :user_id  #Note: unique here: id of the User who is the follower

   	 t.timestamps
    end
  end
end