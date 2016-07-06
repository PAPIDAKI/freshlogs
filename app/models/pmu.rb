class Pmu < ActiveRecord::Base
  
  belongs_to :grower
  has_many :purchases	

  #add geocoding and maps 
  # geocoded_by :village
  # after_validation :geocode
end
