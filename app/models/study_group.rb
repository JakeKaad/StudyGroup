class StudyGroup < ActiveRecord::Base
	include Sluggable

	belongs_to :course
	has_many :memberships, as: :joinable
	has_many :users, through: :memberships
	has_many :posts, as: :postable

	validates :name, presence: true
	validates :description, presence: true

	sluggable_column :name

	def members
		members = []
		self.memberships.each { |membership|  members << membership.user }
		members
	end
end