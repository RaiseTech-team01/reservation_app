class AddReservationToPayments < ActiveRecord::Migration[6.1]
  def change
    add_reference :payments, :reservation, foreign_key: true
  end
end
