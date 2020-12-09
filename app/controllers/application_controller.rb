class ApplicationController < ActionController::Base
	 protect_from_forgery with: :exception

     before_action :configure_permitted_parameters, if: :devise_controller?
     before_action :current_cart


     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name,:last_name ,:email,:phone_number ,:password)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name,:email, :password, :phone_number, :current_password)}
          end

    private
    
    def current_cart
      if session[:cart_id]
        cart = Cart.find_by(:id => session[:cart_id])
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
      end

      if session[:cart_id] == nil
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end      
	
end
