class EventRegistration < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true
  has_and_belongs_to_many :participants, optional: true
  accepts_nested_attributes_for :participants, reject_if: :all_blank, allow_destroy: true # accept participants upon creating a new event_registration
  validates_associated :participants # make sure the accepted participants all are valid participants before committing to database
  
  
  
  # TODO For usability outside our very specific use case, this has to be changed to something more sophisticated.
  def participant_price?(participant)
    if participant.age(self.event.start_date) < 3 # Children under 3 are free
      price = 0
    elsif participant.age(self.event.start_date).between?(3, 10) # Children between 3 and 11 pay Child fee
      price = self.event.child
    elsif participant.age(self.event.start_date).between?(11, 14) # Children between 11 and 14 pay Youth fee
      price = self.event.youth
    else # Everybody else pays full
      self.event.full_price
    end
  end
  
  def price_total?
    @total = 0
    self.participants.each do |participant|
      @total += self.participant_price?(participant)
    end
    return @total
  end
  
  def self.generate_url_token(token_name)
    # Instead of getting a token, returning and failing at validation due to unique constraints which would have the user try again to get a unique random token,
    # we loop here until we get a random token which does not exist in the relevant column of the database yet
    loop do 
      token = SecureRandom.urlsafe_base64
      return token
      break unless EventRegistration.exists?(token_name => token)
    end
    
  end
  
end
