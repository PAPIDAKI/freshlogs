class Attendance < ActiveRecord::Base
  belongs_to :shift_list
  belongs_to :worker
end
