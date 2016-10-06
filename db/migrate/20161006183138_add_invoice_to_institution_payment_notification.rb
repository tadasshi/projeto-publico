class AddInvoiceToInstitutionPaymentNotification < ActiveRecord::Migration
  def change
    add_column :institution_payment_notifications, :invoice, :integer
  end
end
