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

  #after_initialize:default_values

   def default_values
   self.extra_time =0.0
   self.productivity = 0
   end

 #set the hours workgrouped of the Worker from the shift_list it belongs 
  def set_hours_worked_from_shift_list
   self.hours_worked=shift_list.hours_worked
   self.save
  end
  
  def hours_worked_plus_extra_time
   case
   when worker.kind=='Packhouse'
   shift_list.hours_worked+extra_time/60
   when worker.kind=='Fields'
   1
   when worker.kind=='Driver'
   1
   when worker.kind=='Field Supervisor'
   1
   end
  end

     
  def daily_payable
   hours_worked_plus_extra_time*worker.pay_rate
  end

end
