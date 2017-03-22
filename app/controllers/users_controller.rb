class UsersController < ApplicationController
  skip_before_action :check_jwt_for_current_user, only: [:login, :logout, :register]
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def whoami
    render json: { success: true }
  end

  def login
    user = User.find_by_email(params[:user][:email])
    if user.valid_password?(params[:password])
      cookies[:user_jwt] = { value: user.generate_jwt, http_only: true }
      render json: { success: true }
    else
      render json: { success: false }, status: :unauthorized
    end
  end

  def logout
    reset_session
    cookies.delete(:user_jwt)
    render json: { success: true, status: :unauthorized }
  end

  def register
    user = User.create(email: params[:email], password: params[:password], name: params[:name])
    if user.valid?
      user.save
      render json: {success: true}
    else
      render json: {success: false}
    end
  end
end
