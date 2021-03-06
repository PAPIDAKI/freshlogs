# == Schema Information
#
# Table name: artifacts
#
#  id         :integer          not null, primary key
#  name       :string
#  key        :string
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artifact < ActiveRecord::Base
  attr_accessor :upload
  belongs_to :project
  MAX_FILESIZE=10.megabytes
  validates_presence_of :name,:upload
  validates_uniqueness_of :name
  validate :uploaded_file_size

  def uploaded_file_size
  	if upload
  		errors.add(:upload,
  			"File size must be less than #{self.class::MAX_FILESIZE}") unless upload.size<=self.class::MAX_FILESIZE
  	end
  end
end

#HOWTO: This is a how to note
#TODO: delete me 
#FIXME: breaks down
