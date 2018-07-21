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

class Worker < ActiveRecord::Base
	has_many :attendances ,dependent: :destroy 
	has_many :shift_lists,through: :attendances
	has_many :crates
    attr_accessor :age

     # enum kind 
#     enum kind: [:packer, :assistant,:driver,:field,:supervisor]
	 # enum for status 
   #  enum status: [:active, :inactive,:reserve]

	#scope :drivers, -> {where(type:'Driver') }
	#scope :packers, -> {where(type:'Packer')}
	#scope :supervisors, -> {where(type:"Supervisor")}
	#scope :assistants, -> {where(type:'Assistant')}
    #scope :fields, -> {where(type:'Field')}
	# end of sti

	scope :packhouse, -> {where(work_for:'Packhouse')}
	scope :fields, ->{where(work_for:'Fields')}
	scope :active,->{where(status: :active)}
	scope :inactive,->{where(status: :inactive)}
	scope :reserve,-> {where(status: :reserve)}
    scope :all_workers,->{all}	
 
	# def name
		# "#{last_name} #{first_name}"
	# end

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

     def age
       self.age=Time.now.year-self.birthday.year
     end

     def pay_rate
       case 
       when kind=='Packhouse' && self.age >25
       3.93
       when kind=='Packhouse' && self.age<=25
       3.43
       when kind=='Fields'
       25
       when kind=='Field Supervisor'
       70
       when kind=='Driver'
       100
       end
     end

     

      
      def before_save
        self.name.upcase!
      end
      
      def self.packhouse
        where(["kind = ? and status = ?","Packhouse","Active"])
      end

      def self.fields
        where(["kind = ? and status = ?","Fields","Active"])
      end
       
       def self.driver
        where(["kind = ? and status = ?","Driver","Active"])
       end

       def self.field_supervisor
        where(["kind = ? and status = ?","Field Supervisor","Active"])
       end

end


