# == Schema Information
#
# Table name: worker_agreements
#
#  id           :integer          not null, primary key
#  worker_id    :integer
#  agreement_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class WorkerAgreement < ActiveRecord::Base
end
