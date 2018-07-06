# == Schema Information
#
# Table name: workers
#
#  id                 :integer          not null, primary key
#  mobile             :string
#  tenant_id          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  phone              :string
#  insurance          :string
#  active             :boolean
#  area               :string
#  working_experience :string
#  name               :string
#  birthday           :date
#  photo              :string
#  status             :string
#  work_for           :string
#  type               :string
#

class Assistant < Worker

end
