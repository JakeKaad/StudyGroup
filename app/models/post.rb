class Post < ActiveRecord::Base
	include Sluggable

	belongs_to :creator, foreign_key: "user_id", class_name: "User"
	belongs_to :postable, polymorphic: true

	validates :body, presence: true
	validates :title, presence: true

	sluggable_column :title
end