class TransactionsController < ApplicationController
$LOAD_PATH << '.'
include Braintree
protect_from_forgery except: [:hook]


  def new
    gateway = Profile.new.gateway
    @client_token = gateway.client_token.generate
  end

  def hook
    byebug
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @registration = Registration.find params[:invoice]
      @registration.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
    end
    render nothing: true
  end


def create
    #amount = params["amount"]
    gateway = Profile.new.gateway
    amount =  100
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
