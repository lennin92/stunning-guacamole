class CreateActivityTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :activity_types, id: false do |t|
      t.binary :id, limit: 16, primary_key: true
      t.string :name

      t.timestamps
    end
  end
end
