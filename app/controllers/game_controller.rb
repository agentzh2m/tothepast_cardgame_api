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
  end

  # find who turn it is
  def turn_state
    room = Room.find(@current_user.room_id)
    if room.status == 'playing'
      players = room.users.map{|u| u.player}
      check_turn = is_my_turn(room, @current_user)
      p_state = players.select{|p| @current_user.player != p}
      p_state = p_state.map{|p| {
        name: User.find(p.user_id).name,
        uid: p.user_id,
        seqid: p.seqid,
        is_turn: room.turn_counter % 4 == p.seqid,
        num_card: p.card.size
      }}
      # p_turn = players.select{|p| room.turn_counter % 4 == p.seqid}.first
      render json: {
        is_my_turn: check_turn,
        my_card: @current_user.player.card,
        my_character: @current_user.player.character_name,
        other_player_state: p_state
      }
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
    if room.status == 'playing' && is_my_turn(room, @current_user)
      player = @current_user.player
      player.card.push(Card.find(rand(1..Card.count)).name)
      if player.save
        render json: {status: 'success'}
      else
        render json: {status: 'fail', msg: 'fail to add card in db'}
      end
    else
      render json: {status: 'fail'}, status: :bad_request
    end
  end

  def exit_room
    room = Room.find(@current_user.room_id)
    if room.status == 'playing'
      room.users do |u|
        u.player.destroy
        u.player = nil
        u.player.save
        u.status = 'unready'
        u.save
      end
      room.status = 'waiting'
      room.turn_counter = nil
      room.save
      render json: {status: 'success', msg: 'successfully kick everyone out'}
    else
      render json: {status: 'fail', msg: 'you are not playing'}, status: :bad_request
    end
  end

end
