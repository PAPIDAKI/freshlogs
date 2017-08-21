class PackhouseList < ShiftList
	has_many :attedances
	has_many :workers ,through: :attendances 

end