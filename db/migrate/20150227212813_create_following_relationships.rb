class CreateFollowingRelationships < ActiveRecord::Migration
  def change
    create_table :following_relationships do |t|
     t.belongs_to :user, index: true  
     t.belongs_to :followed_user, index: true

   	 t.timestamps
    end
  end
end
