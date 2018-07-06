# == Schema Information
#
# Table name: attendances
#
#  id            :integer          not null, primary key
#  shift_list_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  worker_id     :integer
#  time_diff     :integer
#  note          :string
#

class Attendance < ActiveRecord::Base
  belongs_to :shift_list
  belongs_to :worker

  has_many :att_performances 
end
