# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  name       :string
#  image      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SpecialCard < Card
  belongs_to :card
end
