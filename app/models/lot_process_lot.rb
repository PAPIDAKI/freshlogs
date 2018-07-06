# == Schema Information
#
# Table name: lot_process_lots
#
#  id             :integer          not null, primary key
#  lot_id         :integer
#  process_lot_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class LotProcessLot < ActiveRecord::Base
end
