FactoryBot.define do
  factory :user do
    email { 'example@mail.com' }
    password { '1' }
    mana { 1 }
    happiens { 1 }
    fatigue { 1 }
    money { 1 }
    wins { 1 }
    defeates { 1 }
  end
end
