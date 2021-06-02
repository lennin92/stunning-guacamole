class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities, id: false  do |t|
      t.binary :id, limit: 16, primary_key: true
      t.references :activity_type, type: :binary, foreign_key: true, index: true
      t.string :name
      t.string :description
      t.string :location
      t.references :user, type: :binary, foreign_key: true, index: true

      t.timestamps
    end
  end
end
