class Pmu < ActiveRecord::Base
  
  belongs_to :grower
  has_many :purchases,dependent: :destroy

  #add geocoding and maps 
  geocoded_by :latitude
  after_validation :geocode
  validates :location,:produce,:village,presence: true
  validates :longitude,:latitude,presence: true,numericality: true

  def details
  	"#{grower.name} #{village} - #{location}"
  end


end
