class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments, &:timestamps
  end
end
