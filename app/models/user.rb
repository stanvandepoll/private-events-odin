class User < ApplicationRecord
  has_many :created_events, :foreign_key => "creator_id", :class_name => "Event" 
  has_many :invitations, :foreign_key => "attendee_id"
  has_many :attended_events, :through => :invitations, :source => :event

  require "time"

  def upcoming_created_events
    self.created_events.where("date >= ?", Time.now)
  end

  def upcoming_attended_events
    self.attended_events.where("date >= ?", Time.now)
  end

  def upcoming_events
    self.upcoming_created_events + self.upcoming_attended_events 
  end 

  def previous_created_events
    self.created_events.where("date <= ?", Time.now)
  end

  def previous_attended_events
    self.attended_events.where("date <= ?", Time.now)
  end

  def previous_events
    self.previous_created_events + self.previous_attended_events 
  end 
end
