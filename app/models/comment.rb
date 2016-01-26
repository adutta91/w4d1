# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  text           :string
#  commentable_id :integer
#  comment_type   :string
#  created_at     :datetime
#  updated_at     :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
end
