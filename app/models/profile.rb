class Profile < ApplicationRecord
	$LOAD_PATH << '.'
	include Braintree
	load "#{Rails.root}/lib/braintree.rb"

	belongs_to :user
	has_many :orders, dependent: :destroy
	has_one :address, dependent: :destroy
	accepts_nested_attributes_for :address, allow_destroy: true
#	validates_presence_of :city
	after_update :create_braintree_customer

	def create_braintree_customer
		gateway = Profile.new.gateway
		if braintree_customer_id?
			result = gateway.customer.update(braintree_customer_id,braintree_customer_hash)
			result_hash(result)
		else	
		  result = gateway.customer.create(braintree_customer_hash)
		  result_hash(result)
		end	
	end


  def braintree_customer_hash
	{
		:first_name => first_name, 
		:last_name => last_name, 
		:phone => phone_number
	}
  end


  def result_hash(result)
	if (result.success? && braintree_customer_id?)
		    #update_address_for_braintree_customer
			  puts "customer successfully updated"
		elsif (result.success? && !braintree_customer_id?)
			self.update_attribute(:braintree_customer_id,result.customer.id)
		else	
			  p result.errors
		end
  end

  def update_address_for_braintree_customer
  	res = gateway.address.create(braintree_address_hash)
  	if (res.success? && res.address.id.present?)
  		self.update_attribute(:braintree_address_id,res.address.id)
  	else
  		p res.errors
  	end	
  end

  def braintree_address_hash
  	{
      :customer_id         => '492312426', #self.braintree_customer_id.to_s
		  :first_name          => 'Jenna',
		  :last_name           => 'Smith',
		  :company             => 'Braintree',
		  :street_address      => '1 E Main St',
		  :extended_address    => 'Suite 403',
		  :locality            => 'Chicago',
		  :region              => 'Illinois',
		  :postal_code         => '60622',
		  :country_code_alpha2 => 'US'
  }
  end	




end

