class CardController < ApplicationController

  def remove_card(user, card_name)
    if a.index(card_name).nil?
      return false
    else
      user.card.delete_at(a.index(card_name))
      if user.save
        return true
      else
        return false
      end
    end
  end

  def use
    card_name = params[:card_name]
    user_id = params[:user_id]
    if card_name == 'Steal'
      #remove from a random user
      if remove_card(@current_user, 'Steal')
    elsif card_name == 'Deny'
      if remove_card(@current_user, 'Deny')
      print 'Deny'
    elsif card_name == 'Gold'
      if remove_card(@current_user, 'Gold')
        @current_user.player.gold = @current_user.player.gold + 2
        @current_user.player.save
        render json: {status: 'success'}
      else
        render json: {status: 'fail', msg: 'cannot find card'}, status: :bad_request
    elsif card_name == 'Silver'
      if remove_card(@current_user, 'Silver')
        @current_user.player.gold = @current_user.player.gold + 1
        @current_user.player.save
      else
        render json: {status: 'fail', msg: 'cannot find card'}, status: :bad_request
      end
    else
      render json: {status: 'fail', msg: 'there is no card'}, status: :bad_request
  end

  def buy

end
