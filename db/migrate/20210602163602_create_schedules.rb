class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules, id: false  do |t|
      t.binary :id, limit: 16, primary_key: true
      t.references :activity, type: :binary, foreign_key: true, index: true
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
