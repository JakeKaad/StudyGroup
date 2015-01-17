class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
    	t.integer :user_id
    	t.string  :joinable_type
    	t.integer :joinable_id
    	t.boolean :teacher
    	t.timestamps
    end
  end
end
