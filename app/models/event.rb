class Event < ApplicationRecord
  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"
  has_many :invitations
  has_many :attendees, :through => :invitations

  scope :past, -> { where("date <= ?", Time.now) }
  scope :upcoming, -> { where("date >= ?", Time.now) }
end
