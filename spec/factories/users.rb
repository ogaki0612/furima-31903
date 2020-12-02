FactoryBot.define do
  factory :user do
    nick_name { 'test' }
    email { 'test@example' }
    password { '123abc' }
    password_confirmation { password }
    first_name { '太郎' }
    last_name { '鈴木' }
    first_name_kana { 'タロウ' }
    last_name_kana { 'スズキ' }
    birth_day { '2001-01-01' }
  end
end
