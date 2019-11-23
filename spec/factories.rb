require 'faker'
FactoryBot.define do
  factory :piece do
    
  end

    factory :game do
        name { Faker::Name.unique.name }
    end

    factory :user do
        sequence :email do |n|
          Faker::Internet.email
        end
        password { "secretPassword" }
        password_confirmation { "secretPassword" }
    end
end