FactoryGirl.define do

  factory :age_range do
    low 15
    high 17
  end

  factory :event do
    year DateTime.now.year
    location "Somewhere, Florida"
    registration_cost 100
    registration_count 0
    max_seats 60
    start_date 30.days.from_now
    end_date 35.days.from_now
    hotel nil
    speaker_one "Speaker One"
    speaker_two "Speaker Two"
    speaker_three "Speaker Three"
    topics "Alpha, Beta, Gamma"
  end

  factory :faq do
    title "Stuff"
    body "Lorem ipsum dolor sit"
    list_order 1
    publish true
  end

  factory :user do
    sequence :email do |n|
      "user#{n*2}@example.com"
    end
    password "secret"
    admin false
    activated true
    last_visit 30.days.ago
  end
  
  factory :registration do
    address1 "123 Main St"
    address2 nil
    city "Coolsville"
    state "ME"
    phome "1231231234"
    first_name "Bob"
    last_name "Adob"
    middle_name "Q"
    age_range FactoryGirl.create(:age_range)
    event FactoryGirl.create(:event)
    user FactoryGirl.create(:user)
    zip_code "12345"
    mobile "3213214321"
    country "US"
    comments "I will be arriving late and leaving early"
  end

end
