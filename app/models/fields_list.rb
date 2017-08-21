class FieldsList < ShiftList
	has_many :attendances
	has_many :workers ,through: :attendances
end