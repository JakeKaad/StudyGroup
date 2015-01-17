class CreateStudyGroups < ActiveRecord::Migration
  def change
    create_table :study_groups do |t|
    	t.string :course_id
    	t.string :name
    	t.text 	 :description
    	t.timestamps
    end
  end
end
