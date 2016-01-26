class CreateContactTable < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
