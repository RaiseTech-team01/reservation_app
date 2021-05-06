class AddPaymentToReservations < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :payment, foreign_key: true
  end
end
