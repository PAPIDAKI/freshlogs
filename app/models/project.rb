# == Schema Information
#
# Table name: projects
#
#  id                       :integer          not null, primary key
#  title                    :string
#  details                  :string
#  expected_completion_date :date
#  tenant_id                :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class Project < ActiveRecord::Base
	belongs_to :tenant
	validates_presence_of :title
	validates_uniqueness_of :title
	validate :free_plan_can_only_have_one_project

	has_many :artifacts,dependent: :destroy
	has_one :grower
	has_many :pmus

	def free_plan_can_only_have_one_project
		if self.new_record? && (tenant.projects.count > 0) && (tenant.plan == 'free')
		errors.add(:base, "Free plans cannot have more than one project")
		end
	end

	def self.by_plan_and_tenant(tenant_id)
		tenant=Tenant.find(tenant_id)
		if tenant.plan=='premium'
			tenant.projects
		else
			tenant.projects.order(:id).limit(1)
		end
	end
end
