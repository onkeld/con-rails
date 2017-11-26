class Event < ApplicationRecord
  attr_accessor :status
  has_many :event_registrations
  has_many :participants, through: :event_registrations
  validates :name, :start_date, :end_date, presence: true
  validate :end_date_must_be_after_start_date
  after_validation do |event|
    set_status  
  end
    def set_status
      puts self.start_date
      puts self.end_date
      return unless errors.blank? # if we already hit an error when checking for the presence of all required attributes, we don't need to check the correct order of dates...

      if (Time.now.utc.to_date.year < start_date.year) # The event happens in a future year - active event but registration disabled
        self.status = "pending"
      elsif (Time.now.utc.to_date.year == start_date.year) && (Time.now.utc.to_date < start_date) # The event happens this year, but hasn't happened yet - Registration open
        self.status = "active"
      #elsif Time.now.utc.to_date >= :start_date # We're in the same year as the event, but the event is too close to allow online registrations 
      #  # TODO: figure out how close to the event is too close - one or two weeks in advance sounds reasonable. Will most likely not bee needed anyways since we book out too fast.
      #  self.status = "waiting"
      elsif Time.now.utc.to_date > end_date # The event is in the past
        self.status = "past"
  #    elsif # TODO: Add a case for active events which are booked out for online registration.
  #      self.status = "full"
      elsif Time.now.utc.to_date > start_date && Time.now.utc.to_date < end_date # Today is between start and end date - the event is currently on.
        self.status = "running"
      else
        self.status = nil
      end
    end

    def end_date_must_be_after_start_date
      return unless errors.blank? # if we already hit an error when checking for the presence of all required attributes, we don't need to check the correct order of dates...
      if end_date.present? && end_date <= start_date
        errors.add(:end_date, "can't be the same or earlier than start date")
      end
    end
end
