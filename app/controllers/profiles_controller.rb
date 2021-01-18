class ProfilesController < ApplicationController
   
  def edit
    @profile = current_user.profile
    @profile.build_address if @profile.address.nil?
  end

  def update
      @profile = current_user.profile
		  if @profile.update_attributes(profile_params)
		    flash[:notice] = "Profile updated!"
		    redirect_to profile_path(@profile)
		  else
		    render action: :edit
		  end
  end

  def show
  	@profile = current_user.profile
  end	

	def profile_params
	  params.require(:profile).permit(:id,:first_name, :last_name, :phone_number, :company, :date_of_birth, :is_female,:address ,:address_attributes => [:id, :city, :pincode, :landmark, :address, :street_address, :state])

	end

end
