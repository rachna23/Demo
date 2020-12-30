class ProfilesController < ApplicationController
   
  def edit
    @profile = current_user.profile
    @profile.build_address if @profile.address.nil?
  end

  def update
      @profile = current_user.profile
		  if @profile.update_attributes(profile_params)
		    flash[:success] = "Profile updated!"
		    redirect_path
		  else
		    render action: :edit
		  end
  end

  def show
  	@profile = current_user.profile
  end	

  def redirect_path
  	if params["order"] == "true"
     @order = Order.new(profile: current_user.profile)
		  @current_cart.line_items.each do |item|
		    @order.line_items << item
		   # item.cart_id = nil
		  end
		  @order.save
		  #Cart.destroy(session[:cart_id])
		  #session[:cart_id] = nil
		  redirect_to orders_path
    end  
  end	

	def profile_params
	  params.require(:profile).permit(:id,:first_name, :last_name, :phone_number, :company, :date_of_birth, :is_female,:address ,:address_attributes => [:id, :city, :pincode, :landmark, :address, :street_address, :state])

	end

end
