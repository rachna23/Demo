class OrdersController < ApplicationController

def new
  @profile = current_user.profile
end

def index
  @orders = current_user.profile.orders	
 # @orders = Order.all
end

def show
  @order = Order.find(params[:id])
end


end
