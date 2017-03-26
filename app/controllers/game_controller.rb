class GameController < ApplicationController
  skip_before_action :check_jwt_for_current_user, only: [:login, :logout, :register]
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def is_in_game
    if !@current_user.player.nil?
      render json: {status: 'ingame'}
    else
      render json: {status: 'not ingame'}
    end
  end

  def is_my_turn(room, user)
    room.turn_counter % 4 == user.player.seqid

  # find who turn it is
  def turn_state
    room = Room.find(@current_user.room_id)
    if room.status == 'playing'
      players = room.players
      check_turn = is_my_turn(room, @current_user)
      whose_turn = players.select{|p| room.turn_counter % 4 == p.seqid}.first
      render json: {is_my_turn: check_turn, my_card: @current_user.card, whose_turn: whose_turn player_state: players}
    else
      render json: {status: 'fail'}, status: :bad_request
    end
  end

  def end_turn
    room = Room.find(@current_user.room_id)
    room.turn_counter = room.turn_counter + 1
    if room.status == 'playing' && is_my_turn(room, user) && room.save
      render json: {status: 'success'}
    else
      render json: {status: 'fail'}, status: :bad_request
    end
  end

  def draw_card
    room = Room.find(@current_user.room_id)
    rand = Random.new(1234)
    if room.status == 'playing' && is_my_turn(room, user)
      player = @current_user.player
      player.card.push(Card.find(rand(1..Card.count)))
      if player.save
        render json: {status: 'success'}
      else
        render json: {status: 'fail', msg: 'fail to add card in db'}
      end
    else
      render json: {status: 'fail'}, status: :bad_request
    end
  end

end
