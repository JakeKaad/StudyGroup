class Membership < ActiveRecord::Base
	belongs_to :user
	belongs_to :joinable, polymorphic: true

	validates_uniqueness_of :user_id, scope: [:joinable_type, :joinable_id]
end