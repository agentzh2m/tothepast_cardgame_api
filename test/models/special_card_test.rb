# == Schema Information
#
# Table name: special_cards
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  cards_id    :integer
#  cost        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SpecialCardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
