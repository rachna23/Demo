class TransactionsController < ApplicationController
include Braintree

  def new
    gateway = Profile.new.gateway
    @client_token = gateway.client_token.generate
  end


def create
    amount = params["amount"] # In production you should not take amounts directly from clients
    nonce = params["payment_method_nonce"]
    byebug
    result = gateway.transaction.sale(amount: amount,payment_method_nonce: nonce,:customer_id => current_user.profile.try(:braintree_customer_id),:options => {:submit_for_settlement => true})
    if result.success? || result.transaction
      redirect_to checkout_path(result.transaction.id)
    else
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
      flash[:error] = error_messages
      redirect_to new_checkout_path
    end
  end


end
