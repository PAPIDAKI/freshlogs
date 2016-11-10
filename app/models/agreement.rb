class Agreement < ActiveRecord::Base
  belongs_to :shift_list
  has_many :worker_agreements
  has_many :workers,through: :worker_agreements
  # worker_agreements_
end
