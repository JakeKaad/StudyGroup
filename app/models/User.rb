class User < ActiveRecord::Base
	has_many :posts
	has_many :memberships
	has_many :courses, :through => :memberships, :source => :joinable, :source_type => "Course"

	has_secure_password
	
	validates :username, presence: true
	validates :password, length: { minimum: 5}, allow_nil: true

end