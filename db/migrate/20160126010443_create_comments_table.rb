class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :commentable_id
      t.string :comment_type

      t.timestamps
    end

    add_column :contacts, :favorite, :boolean
    add_index :comments, :commentable_id
  end
end
