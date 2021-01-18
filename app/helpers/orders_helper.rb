module OrdersHelper
 
 def before_checkout(user)
 	user.profile.orders.present? && user.profile.orders.map(&:addresses).present?
 end

 def check_preffered_address(user)
 	ord = current_user.profile.orders
 	ord.joins(:addresses).where("addresses.default IS NOT NULL").present?
 end
  
end
