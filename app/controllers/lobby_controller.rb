class LobbyController < ApplicationController
  skip_before_action :check_jwt_for_current_user, only: [:login, :logout, :register]
  skip_before_filter :verify_authenticity_token
  respond_to :json

  

end
