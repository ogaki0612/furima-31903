FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nick_name { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name { person.first.kanji }
    last_name { person.last.kanji }
    first_name_kana { person.first.katakana }
    last_name_kana { person.last.katakana }
    birth_day { Faker::Date.in_date_period }
  end
end
