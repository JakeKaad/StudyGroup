class Course < ActiveRecord::Base
	has_many :study_groups
	has_many :memberships, as: :joinable
	has_many :users, through: :memberships
	has_many :posts, as: :postable

	validates :name, presence: true
	validates :description, presence: true
	

	def teacher
		self.memberships.find_by(teacher: true).user
	end

	def students
		students = []
		self.memberships.where(teacher: false).each { |membership|  students << membership.user }
		students
	end

	
end