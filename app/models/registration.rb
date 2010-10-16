class Registration < ActiveRecord::Base

  belongs_to :user
  belongs_to :event

  before_validation :normalize


  validates_presence_of [:address1,:city, :state, :zip_code, :phone]
  validates_length_of :first_name, :minimum => 2, :message => 'That is too short to be your name'
  validates_length_of :last_name, :minimum => 2, :message => 'That is too short to be your last name'
  validates_length_of :address1, :minimum => 3, :message => 'That is a pretty short address'
  validates_length_of :phone, :minimum => 10, :message => 'Please provide phone number with area code'
  validates_length_of :state, :is => 2, :message => 'Please provide 2 letter state abbreviation'
  validates_format_of :zip_code, :with => /\A[0-9]{5}-?[0-9]*\Z/, :message => 'Bad zip code'
  validates_format_of :phone, :with => /\A[-0-9+., eExXtT()]{10,}\Z/, :message => 'That does not look like a phone number to me'
  validates_format_of :mobile, :with => /\A[-0-9+., eExXtT()]{10,}\Z/, :message => 'That does not look like a phone number to me'
  
  def self.setup_new_registration(user,event,attributes=nil)
     registration = 
         (user && Registration.find(:first, :conditions => ["user_id = ? and event_id = ?",  user.id, event.id ])) ||
      Registration.new(attributes)
     if user && registration.new_record? && (registration.last_name.nil? || registration.last_name == '')
        last_years_reg = Registration.find_by_user_id(user.id, :order => 'updated_at desc')
         if last_years_reg
           registration = last_years_reg.clone
           registration.event_id = event.id
           registration.amount_owed = event.registration_cost
           registration.amount_paid = 0
         end
     end
    registration
  end
  
   private

   def normalize
      state.upcase! if state
   end

end
