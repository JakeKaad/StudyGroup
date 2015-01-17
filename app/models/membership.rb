class Membership < ActiveRecord::Base
	belongs_to :user
	belongs_to :joinable, polymorphic: true

end