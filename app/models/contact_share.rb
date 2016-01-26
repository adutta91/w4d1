# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  contact_id :integer          not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class ContactShare < ActiveRecord::Base
  validates :contact_id, presence: true, :uniqueness => { :scope => :user_id }
  validates :user_id, presence: true

  belongs_to :user,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: "User"

  belongs_to :contact,
    foreign_key: :contact_id,
    primary_key: :id,
    class_name: "Contact"
end
