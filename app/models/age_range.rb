class AgeRange < ApplicationRecord

  has_many :registrations

  def to_s
     "#{low} - #{high}"
  end
end
