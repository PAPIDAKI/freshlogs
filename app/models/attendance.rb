class Attendance < ActiveRecord::Base
  belongs_to :shift_list
  belongs_to :worker

  has_many :att_performances 
end
