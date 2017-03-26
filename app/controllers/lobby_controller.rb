class LobbyController < ApplicationController
  skip_before_action :check_jwt_for_current_user, only: [:login, :logout, :register]
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def join
    room = Room.find(params[:id])
    if @current_user.room_id.nil?
      @current_user.room_id  = room.id
      @current_user.status = 'unready'
      if @current_user.save
        render json: {status: 'success', room: room}
      end
    else
      render json: {status: 'fail'}, status: :bad_request
    end
  end

  def exit
    room = Room.find(@current_user.room_id)
    @current_user.room_id = nil
    @current_user.status = nil
    if @current_user.save
      msg = 'exit room normally'
      if room.users.size == 0
        msg = 'there is no one in the room destroy the room also'
        room.destroy
      end
      render json: {status: 'success', msg: msg}
    else
      render json: {status: 'fail'}, status: :bad_request
    end
  end

  def ready
    if @current_user.status.nil?
      render json: {status: 'fail'}, status: :bad_request
    end
    @current_user.status = 'ready'
    if @current_user.save
      room = Room.find(@current_user.room_id)
      state = room.users.select{|u| u.status == 'ready'}
      room.turn_counter = 0
      if state.size == 4
        players = room.users.to_a.map{ |u| Player.create(user: u)}
        rand = Random.new(1234)
        characters = Character.all.to_a
        players.to_a.each_with_index do |p, i|
          p.seqid = i
          0.upto(3) do |_|
            p.card.push(Card.find(rand(1..Card.count)).name)
          end
          p.character_name = characters.pop.name
          p.save
        end
        room.status = 'playing'
        room.save
      end
      render json: {status: 'success'}
    else
      render json: {status: 'fail'}, status: :bad_request
    end
  end

  def unready
    if @current_user.status.nil?
      render json: {status: 'fail'}, status: :bad_request
    end
    @current_user.status = 'unready'
    if @current_user.save
      render json: {status: 'success'}
    else
      render json: {status: 'fail'}, status: :bad_request
    end
  end


  # def check_allready
  #   if !@current_user.room_id.nil?
  #     state = room.users.to_a.map{|u| u.status == 'ready'}
  #     render json: {status: 'success', is_all_ready: state.size == 4, ready_users: state}
  #   else
  #     render json: {status: 'fail'}
  #   end
  # end

end
