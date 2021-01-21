module ProfilesHelper

  def full_name
    [current_user.profile.first_name  + current_user.profile.last_name].reject(&:blank?).join('  ').titleize
  end

  def first_name
    current_user.profile.first_name
  end

  def email
    current_user.email.split('@').first + '@'
  end

  def address
    current_user.profile.address || "NA"
  end

  def company
    current_user.profile.company || "NA"
  end

  def dob
    current_user.date_of_birth.strftime(" %b %d, %Y") rescue "NA"
  end

  def phone
    current_user.phone || "NA"
  end

end
