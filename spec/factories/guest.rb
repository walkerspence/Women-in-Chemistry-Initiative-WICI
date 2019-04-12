FactoryGirl.define do
  factory :guest do
    firstname "John"
    lastname "Smith"
    email "john@smith.com"
    occupation "other"
    gender "other"
    department "other"
  end

  factory :invalid_guest, parent: :guest do
    firstname "John"
    lastname "Smith"
    email "notgood"
    occupation "other"
    gender "other"
    department "other"
  end
end