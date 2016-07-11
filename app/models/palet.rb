class Palet < ActiveRecord::Base
	# belongs_to :tenant
	# belongs_to :grower
	# belongs_to :purchase
	# belongs_to :lot
	

	belongs_to :loading
	has_many :purchases, through: :lots
	has_many :pmus ,through: :purchases
	has_many :growers,through: :pmus

	has_many :palet_line_items,dependent: :destroy
	has_many :lots,through: :palet_line_items 
      accepts_nested_attributes_for :palet_line_items,allow_destroy: true 
      accepts_nested_attributes_for :lots,allow_destroy: true

      validates :code ,presence: true
end
