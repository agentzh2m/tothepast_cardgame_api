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
#  room_id    :integer
#  card       :string           default("{}"), is an Array
#  seqid      :integer
#

class Player < ApplicationRecord
  belongs_to :user
  has_many :cards
  has_one :character
end
