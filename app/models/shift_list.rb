class ShiftList < ActiveRecord::Base
	belongs_to :tenant
	has_many :attendances,dependent: :destroy
	has_many :workers,through: :attendances
	has_many :workgroups,through: :workers

	accepts_nested_attributes_for :attendances

    # sti implementation
	self.inheritance_column = :type

	def self.types
		%(PackhouseList FieldsList) 
	end

	scope :packhouse_lists, -> {where(type:'PackhouseList') }
	scope :fields_lists, -> {where(type:'FieldsList')}
    #end of sti


	def hours_worked
		(end_at-start_at)/60/60
	end



end
