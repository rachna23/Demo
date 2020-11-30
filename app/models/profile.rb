class Profile < ApplicationRecord
	include Braintree
	load "#{Rails.root}/lib/braintree.rb"

	belongs_to :user
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
			  puts "customer successfully updated"
		elsif (result.success? && !braintree_customer_id?)
			self.update_attribute(:braintree_customer_id,result.customer.id)
		else	
			  p result.errors
		end
  end	



end

