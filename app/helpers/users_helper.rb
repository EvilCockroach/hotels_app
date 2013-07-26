module UsersHelper

	def user_by_user_id(user_hotel)
		User.find(user_hotel.user_id).name
	end
end
