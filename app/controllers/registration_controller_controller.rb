class RegistrationControllerController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:name, :status, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :status, :email, :password, :password_confirmation, :current_password)
  end
end
