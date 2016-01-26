# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  favorite   :boolean
#

class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, :uniqueness => {:scope => :user}
  validates :user_id, presence: true

  belongs_to :user,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: "User"

  has_many :contact_shares,
    foreign_key: :contact_id,
    primary_key: :id,
    class_name: "ContactShare"

  has_many :shared_users,
    through: :contact_shares,
    source: :user

  has_many :comments, as: :commentable
  
end
