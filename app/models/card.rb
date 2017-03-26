# == Schema Information
#
# Table name: cards
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class Card < ApplicationRecord
  
end
