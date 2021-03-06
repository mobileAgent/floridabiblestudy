class Event < ActiveRecord::Base
  has_many :registrations
  
  # microformat support
  def start_cal
    start_date.strftime("%Y-%m-%d")
  end

  # microformat support (needs +1 day)
  def end_cal
    end_date.tomorrow.strftime("%Y-%m-%d")
  end

  # format for home page month, day
  def start_text
    start_date.strftime("%B %e")
  end
  
  # format for home page month, day
  def end_text
    if (end_date.mon == start_date.mon)
      end_date.strftime("%e")
    else
      end_date.strftime("%B %e")
    end
  end
  
end
