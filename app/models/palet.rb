# == Schema Information
#
# Table name: palets
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  date       :datetime
#  code       :string
#  loading_id :integer
#  tenant_id  :integer
#  note       :string
#  packed_for :string
#

class Palet < ActiveRecord::Base
    before_create :capitalize_packed_for
    before_update :capitalize_packed_for

	belongs_to :loading
	has_many :purchases, through: :lots
	has_many :pmus ,through: :purchases
	has_many :growers,through: :pmus

	has_many :palet_line_items,dependent: :destroy
	has_many :lots,through: :palet_line_items 
      accepts_nested_attributes_for :palet_line_items,allow_destroy: true 
      accepts_nested_attributes_for :lots,allow_destroy: true

      validates :code ,presence: true,uniqueness: true


    def loading_descripion  
      "#{code} (#{date.strftime("%H:%M - %e/%m/%y  %a")})"
    end

    def form_description
      self.loading_descripion
    end
     private 

     	def capitalize_packed_for
     		self.packed_for.capitalize!
     	end

      def description
        '#{note}'
      end

end
