class TransactionsController < ApplicationController
$LOAD_PATH << '.'
include Braintree

  def new
    gateway = Profile.new.gateway
    @client_token = gateway.client_token.generate
  end


def create
    #amount = params["amount"]
    gateway = Profile.new.gateway
    amount = @current_cart.line_items.map(&:product).map(&:price).sum.to_f || 100
    nonce = params["payment_method_nonce"]
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
