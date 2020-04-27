class AddPhoneNumberToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :mobile_number, :string
  end
end
