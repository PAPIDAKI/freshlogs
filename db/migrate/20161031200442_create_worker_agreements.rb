class CreateWorkerAgreements < ActiveRecord::Migration
  def change
    create_table :worker_agreements do |t|
      t.integer :worker_id
      t.integer :agreement_id

      t.timestamps null: false
    end
  end
end
