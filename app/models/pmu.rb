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
  	"#{grower.mobile} #{village} - #{location}"
  end

  def grower_name_and_location
        "#{grower.mobile} - #{location}"
  end



end
