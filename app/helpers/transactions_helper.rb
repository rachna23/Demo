module TransactionsHelper
	def check_address
		current_user.profile.orders.joins(:addresses).present?
	end	
end
