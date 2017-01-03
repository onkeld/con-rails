class Participant < ActiveRecord::Base
  has_many :registrations
  has_many :events, :through => :registrations
  
  validates_presence_of :last_name
  validates_presence_of :first_name
  validates_presence_of :email
  validates :email, uniqueness: true
end