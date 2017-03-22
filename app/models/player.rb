# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  characer   :string
#  gold       :integer
#  isTurn     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Player < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :cards
end
