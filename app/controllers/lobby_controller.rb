class LobbyController < ApplicationController
  skip_before_action :check_jwt_for_current_user, only: [:login, :logout, :register]
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def join
    room = Room.find(params[:id])
    if @current_user.room_id.nil?
      @current_user.room_id  = room.id
      if @current_user.save
        render json: {status: 'success', room: room}
      end
    else
      render json: {status: 'fail'}
    end
  end

  def exit
    room = Room.find(@current_user.room_id)
    @current_user.room_id = nil
    if @current_user.save
      msg = 'exit room normally'
      if room.users.size == 0
        msg = 'there is no one in the room destroy the room also'
        room.destroy
      end
      render json: {status: 'success', msg: msg}
    else
      render json: {status: 'fail'}
    end
  end

  def ready
    if @current_user.status.nil?
      render json: {status: 'fail'}
    end
    @current_user.status.status = 'ready'
    if @current_user.save
      render json: {status: 'success'}
    else
      render json: {status: 'fail'}
    end
  end

  def unready
    if @current_user.status.nil?
      render json: {status: 'fail'}
    end
    @current_user.status = nil
    if @current_user.save
      render json: {status: 'success'}
    else
      render json: {status: 'fail'}
    end
  end

end
