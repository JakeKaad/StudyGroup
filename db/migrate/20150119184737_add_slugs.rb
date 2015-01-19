class AddSlugs < ActiveRecord::Migration
  def change
  	add_column :users, :slug, :string
  	add_column :posts, :slug, :string
  	add_column :study_groups, :slug, :string
  	add_column :courses, :slug, :string
  end
end
