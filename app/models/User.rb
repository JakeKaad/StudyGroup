class User < ActiveRecord::Base
	include Sluggable

	has_many :posts
	has_many :memberships
	has_many :courses, :through => :memberships, :source => :joinable, :source_type => "Course"
	has_many :study_groups, :through => :memberships, :source => :joinable, :source_type => "StudyGroup"

	has_secure_password
	
	validates :username, presence: true, case_sensitive: false
	validates :password, length: { minimum: 5}, allow_nil: true

	sluggable_column :username

end