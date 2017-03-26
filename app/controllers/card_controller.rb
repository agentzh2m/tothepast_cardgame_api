class CardController < ApplicationController

  def remove_card(user, card_name)
    if a.index(card_name).nil?
      render json:{status: 'fail', msg: 'you do not have that card to remove'}, status: :bad_request
    else
      user.card.delete_at(a.index(card_name))
      if user.save
        render json:{status: 'success', msg: 'successfully remove the card'}
      else
        render json:{status: 'fail', msg: 'fail to remove the card due to db'}, status: :bad_request
      end
    end

  end

  def use
    card_name = params[:name]
    if card_name == 'Steal'
      print 'Steal'
    elsif card_name == ''
  end

end
