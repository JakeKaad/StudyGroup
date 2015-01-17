class Post < ActiveRecord::Base
	belongs_to :creator, foreign_key: "user_id", class_name: "User"

	validates :body, presence: true
	validates :title, presence: true
end