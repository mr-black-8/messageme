class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.integer :contact_id
      t.string :status

      t.timestamps null: false
    end
  end
end
