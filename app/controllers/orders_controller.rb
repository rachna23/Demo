class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

def new
  @profile = current_user.profile
  @cart = current_user.cart
  find_all_address
end


def find_all_address
  ord = current_user.profile.orders
  @addresses = ord.map(&:addresses).flatten
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
      format.html { redirect_to new_order_path, notice: 'Address was successfully created.' }
      format.json { render :show, status: :created, location: @order }
    else
      format.html { render :new }
      format.json { render json: @order.errors, status: :unprocessable_entity }
    end
  end
end

  def edit
    @address = Address.find(params[:address])
    # @order = Order.includes(:addresses).find(params[:id])
    @order.addresses.build unless @order.addresses.any?
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
	params.require(:order).permit(:profile_id, addresses_attributes: [ :id, :city, :pincode, :landmark, :address, :street_address, :state_id, :_destroy])
end


end
