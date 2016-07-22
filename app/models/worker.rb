class Worker < ActiveRecord::Base
	belongs_to :course
	has_many :attendances
	has_many :shift_lists,through: :attendances

	def name
		"#{last_name} #{first_name}"
	end

	def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	  	worker_hash=row.to_hash
	  	worker=Worker.where(w_id: worker_hash['w_id'])
	  	if worker.count==1
	  		worker.first.update_attributes(worker_hash)
	  	else
	  		Worker.create!(worker_hash)
	  	end
	  end
 end
end


