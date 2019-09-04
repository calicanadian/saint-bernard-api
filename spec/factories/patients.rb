FactoryBot.define do
  factory :patient do
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    mr { "MyString" }
    dob { "2019-09-04 10:12:36" }
    gender { 1 }
  end
end
