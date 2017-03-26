class CardController < ApplicationController

  def remove_card(user, card_name)
    if a.index(card_name).nil?
      return false
    else
      user.card.delete_at(a.index(card_name))
      user.save
    end
  end

  def use
    rand = Random.new(1234)
    card_name = params[:card_name]
    user_id = params[:user_id]
    if card_name == 'Steal'
      #steal a random card from your selected user
      if remove_card(@current_user, 'Steal')
        steal_from = User.find(user_id)
        cards = steal_from.player.card
        del_index = rand(cards.size)
        card_to_steal = cards[del_index]
        cards.delete_at(del_index)
        steal_from.player.card = cards
        steal_from.player.save
        #steal the card to you
        @current_user.player.card.push(card_to_steal)
        @current_user.player.save
      else
        render json: {status: 'fail', msg: 'cannot find card'}, status: :bad_request
      end
    elsif card_name == 'Deny'
      if remove_card(@current_user, 'Deny')
        render json: {status: 'success', msg: 'not implemented'}
      else
        render json: {status: 'fail', msg: 'cannot find card'}, status: :bad_request
      end
    elsif card_name == 'Gold'
      if remove_card(@current_user, 'Gold')
        @current_user.player.gold = @current_user.player.gold + 2
        @current_user.player.save
        render json: {status: 'success'}
      else
        render json: {status: 'fail', msg: 'cannot find card'}, status: :bad_request
      end
    elsif card_name == 'Silver'
      if remove_card(@current_user, 'Silver')
        @current_user.player.gold = @current_user.player.gold + 1
        @current_user.player.save
      else
        render json: {status: 'fail', msg: 'cannot find card'}, status: :bad_request
      end
    else
      render json: {status: 'fail', msg: 'there is no card that matches our db'}, status: :bad_request
    end
  end

  def buy
    render json: {status: 'fail', msg: 'not implemented'}, status: :bad_request
  end

end
