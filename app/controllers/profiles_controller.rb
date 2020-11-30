class ProfilesController < ApplicationController
   
  def edit
      @profile = current_user.profile
  end

  def update
      @profile = current_user.profile
		  if @profile.update_attributes(profile_params)
		    flash[:success] = "Profile updated!"
		    redirect_to edit_profile_path
		  else
		    render action: :edit
		  end
  end

	def profile_params
	  params.require(:profile).permit(:id,:first_name, :last_name, :phone_number, :company, :date_of_birth, :is_female)
	end

end
