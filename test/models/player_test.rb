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
#

require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
