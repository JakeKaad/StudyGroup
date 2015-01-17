class StudyGroup < ActiveRecord::Base
	belongs_to :course
	has_many :memberships, as: :joinable
	has_many :users, through: :memberships
	has_many :posts, as: :postable
end