class TransactionsController < ApplicationController

  def new
    @client_token = gateway.client_token.generate
   # @cart = current_user.cart
  end

  def create
    result = gateway.customer.create(braintree_customer_hash)
    nonce = params["payment_method_nonce"]
    if result.success?
      create_payment_braintree(result, nonce)
    else
      error_messages(result)
    end
  end

  def create_payment_braintree(result, nonce)
    amount= current_user.cart.sub_total
    current_user.profile.update_attribute(:braintree_customer_id, result.customer.id)
    transaction_result = gateway.transaction.sale(payment_hash(amount, nonce))
    result_status(transaction_result)
  end

  def payment_hash(amount, nonce)
  {
    amount: amount,
    payment_method_nonce: nonce,
    :customer_id => current_user.profile.braintree_customer_id,
    :options => { :submit_for_settlement => true }
  }
  end

  def result_status(transaction_result)
    if transaction_result.success? || transaction_result.transaction
      current_user.update(payment_status: "Success")
      redirect_to transaction_success_path
      flash[:notice] = 'Payment done sucessfully'
    else
      error_messages(transaction_result)
    end
  end  

  def error_messages(result)
    error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
    flash[:alert] = error_messages
    redirect_to new_transaction_path
  end

  def transaction_success
  end  

  def braintree_customer_hash
  {
    :first_name => "Jen",
    :last_name => "Smith",
    :company => "Braintree",
    :email => "jen@example.com",
    :phone => "312.555.1234",
    :fax => "614.555.5678",
    :website => "www.example.com"
  }
  end

  def gateway
    env = Braintree::Configuration.environment = :sandbox
    @gateway ||= Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => 'phng4ppqvqx6gf6y',
      :public_key => 'g9wwc4j5png82cp5',
      :private_key => '11e2635fef7fcc600de045b2c1e75d23'
    )
  end  

end


