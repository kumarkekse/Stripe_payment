class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :stripe_customer_id
      t.string :stripe_payment_method_id

      t.timestamps
    end
  end
end
