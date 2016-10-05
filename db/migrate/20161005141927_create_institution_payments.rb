class CreateInstitutionPayments < ActiveRecord::Migration
  def change
    create_table :institution_payments do |t|
      t.references :institution, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
