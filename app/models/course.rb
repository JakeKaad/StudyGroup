class Course < ActiveRecord::Base
	has_many :memberships, as: :joinable
	has_many :users, through: :memberships

	def teacher
		self.memberships.find_by(teacher: true).user
	end
end