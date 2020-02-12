FactoryBot.define do

  # Incase if you have not generated user model till now do generate user model like this 👇🏻
  # rails g factory_bot:model user
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) {|n| "#{n}-#{ Faker::Internet.email}"}
    password { Faker::Internet.password(min_length:12) }
  end
end
