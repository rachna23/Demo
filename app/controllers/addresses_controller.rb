class AddressesController < ApplicationController

	def index
    ord = current_user.profile.orders
    @addresses = ord.map(&:addresses).flatten
  end

  def preferred
  	Address.update_all(default: 0)
  	add = Address.find(params[:address_id])
  	add.update(default:1)
  end	


end
