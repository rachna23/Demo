module OrdersHelper

  def before_checkout
    orders.present? && orders.map(&:addresses).present?
  end

  def check_preffered_address
    orders.joins(:addresses).where('addresses.default IS NOT NULL').present?
  end

  def preffered_address
    Address.where("addresses.default IS True")
  end	

  def orders
    current_user.profile.orders
  end
  
end
