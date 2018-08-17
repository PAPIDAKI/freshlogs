# == Schema Information
#
# Table name: pmus
#
#  id            :integer          not null, primary key
#  produce       :string
#  village       :string
#  location      :string
#  size          :integer
#  plants        :integer
#  production    :integer
#  facilities    :string
#  certification :string
#  latitude      :float
#  longitude     :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  grower_id     :integer
#  tenant_id     :integer
#

class Pmu < ActiveRecord::Base
  
  belongs_to :grower 
  has_many :purchases,dependent: :destroy
  has_many :crates
  has_many :drivers,through: :crates
  has_one :to_pmu ,:class_name => 'Pmu'
  has_one :from_pmu,:class_name => 'Pmu'
  #add geocoding and maps 
  geocoded_by :latitude
  after_validation :geocode
  validates :location,:produce,:village,presence: true
  validates :longitude,:latitude,presence: true,numericality: true

  def details
  	" #{grower.name} : #{village} - #{location} "
  end

  def grower_name_and_location
        "#{grower.mobile} - #{location}"
  end



end
