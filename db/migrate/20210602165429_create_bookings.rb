class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings, id: false  do |t|
      t.binary :id, limit: 16, primary_key: true
      t.references :schedule, type: :binary, foreign_key: true, index: true
      t.references :user, type: :binary, foreign_key: true, index: true

      t.timestamps
    end
  end
end
