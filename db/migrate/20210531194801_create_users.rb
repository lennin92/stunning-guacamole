class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: false do |t|
      t.binary :id, limit: 16, primary_key: true
      t.string :username
      t.string :password_digest
      t.string :email
      t.boolean :admin

      t.timestamps
    end
  end
end
