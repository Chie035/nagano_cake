# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
   before_action :reject_inactive_costomer, only: [:create]
   

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
   def after_sign_in_path_for(resource)
       root_path
   end
   
   protected
   def reject_inactive_costomer
      @costomer = Costomer.find_by(email: params[:costomer][:email].downcase)
      
      if @costomer
          if (@costomer.valid_password?(params[:costomer][:password]) && (@costomer.active_for_authentication? == false))
              flash[:error] = "退会済みです"
              redirect_to new_costomer_session_path
          end
      end
   end
   
   
end
