class AddressesController < ApplicationController

  def index
    @addresses = orders.map(&:addresses).flatten
  end

  def preferred
	  Address.update_all(default: 0)
	  add = Address.find(params[:address_id])
	  add.update(default: 1)
  end

  def add_address
    @order = Order.new
    1.times { @order.addresses.build }
  end

end
