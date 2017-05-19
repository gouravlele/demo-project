class RegistrationsController < Devise::RegistrationsController
	def create    
    if verify_recaptcha
      super
    else
      build_resource
      clean_up_passwords(resource)
      flash.now[:alert] = "There was an error with the recaptcha code below. Please re-enter the code."
      render :new
    end
  end

  private
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :user_name,:mobile_no, :email, :password, :password_confirmation,:avatar)
  end
  
end
