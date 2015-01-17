class Course < ActiveRecord::Base
	has_many :memberships, as: :joinable
	has_many :users, through: :memberships
	has_many :posts, as: :postable
	

	def teacher
		self.memberships.find_by(teacher: true).user
	end
end