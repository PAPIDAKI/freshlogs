class Pmu < ActiveRecord::Base
  
  belongs_to :grower
  has_many :purchases	

  #add geocoding and maps 
  geocoded_by :latitude
  after_validation :geocode
  validates :location,presence: true


end
