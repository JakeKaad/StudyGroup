module ApplicationHelper

	def fix_date_time(time)
		#if logged_in? && !current_user.time_zone.blank?
			#time = time.in_time_zone(current_user.time_zone)
		#end
		time.strftime("%B %d, '%y at %I:%M%p %Z")
	end

end
