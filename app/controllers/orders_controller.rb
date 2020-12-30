class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

def new
  @profile = current_user.profile
  @order = Order.new
  @order.build_billing_address if @order.billing_address.nil?
  @order.build_shipping_address if @order.shipping_address.nil?
end


def index
  @orders = current_user.profile.orders
 # @orders = Order.all
end

def show
  @order = Order.find(params[:id])
end

def create
  @order = Order.new(order_params)
  respond_to do |format|
    if @order.save
      format.html { redirect_to @order, notice: 'Order was successfully created.' }
      format.json { render :show, status: :created, location: @order }
    else
      format.html { render :new }
      format.json { render json: @order.errors, status: :unprocessable_entity }
    end
  end
end

def edit
end

def update
  respond_to do |format|
    if @order.update(order_params)
      format.html { redirect_to @order, notice: 'order was successfully updated.' }
      format.json { render :show, status: :ok, location: @order }
    else
      format.html { render :edit }
      format.json { render json: @order.errors, status: :unprocessable_entity }
    end
  end
end

private

def set_order
  @order = Order.find(params[:id])
end


def order_params
	params.require(:order).permit(:profile_id, billing_address_attributes: [ :id, :city, :pincode, :landmark, :address, :street_address, :state_id], shipping_address_attributes: [ :id, :city, :pincode, :landmark, :address, :street_address, :state_id])
end


end
