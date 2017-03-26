# == Schema Information
#
# Table name: rooms
#
#  id           :integer          not null, primary key
#  status       :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  turn_counter :integer
#

class Room < ApplicationRecord
  has_many :users
end
