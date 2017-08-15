class Driver < Worker
	has_many :crates
	has_many :pmus ,through: :crates
	
end