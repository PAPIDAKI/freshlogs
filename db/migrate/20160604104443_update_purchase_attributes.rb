class UpdatePurchaseAttributes < ActiveRecord::Migration
  def up
  	# # remove_column :purchases,:price
  	# add_column :purchases,:price,:float
  	# remove_column :purchases,:unit
  	# add_column :purchases,:unit,:string
  	# remove_column :purchases,:note
  	# add_column :purchases,:note ,:string
  	# remove_column :purchases,:pmu_id
  	# add_column :purchases,:pmu_id,:integer,:index=>true
  end

  def downcase
  	# remove_column :purchases,[:price,:unit,:note,:pmu_id]
  end
end
