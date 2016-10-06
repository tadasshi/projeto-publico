class CreateInstitutionPaymentNotifications < ActiveRecord::Migration
  def change
    create_table :institution_payment_notifications do |t|
      t.text :params
      t.string :status
      t.string :transaction_id
      t.integer :custom

      t.timestamps null: false
    end
  end
end
