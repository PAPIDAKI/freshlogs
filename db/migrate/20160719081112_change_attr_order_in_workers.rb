class ChangeAttrOrderInWorkers < ActiveRecord::Migration
  def change
  	change_column :workers,:first_name,:string,after: :last_name
  	change_column :workers,:phone,:string,after: :first__name
  	change_column :workers,:mobile,:string,after: :phone
  	change_column :workers,:insurance,:string,after: :mobile
  	add_column :workers,:area,:string
  	change_column :workers,:area,:string,after: :insuranse
  	add_column :workers,:working_experience,:string
  	change_column :workers,:working_experience,:string,after: :area
  	change_column :workers,:age,:integer,after: :working_experience
  	change_column :workers,:active,:bool,after: :working_experience



  end
end
