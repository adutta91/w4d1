class ChangeCommentTable < ActiveRecord::Migration
  def change
    remove_column :comments, :comment_type, :string
    add_column :comments, :commentable_type, :string
  end
end
