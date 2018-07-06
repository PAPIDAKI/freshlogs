# == Schema Information
#
# Table name: process_lots
#
#  id         :integer          not null, primary key
#  date       :datetime
#  lot        :string
#  quantity   :integer
#  note       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProcessLot < ActiveRecord::Base
end
