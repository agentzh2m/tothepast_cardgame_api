# == Schema Information
#
# Table name: players
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  gold           :integer
#  isTurn         :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  room_id        :integer
#  card           :string           default("{}"), is an Array
#  seqid          :integer
#  character_name :string
#  is_draw        :boolean
#

require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
