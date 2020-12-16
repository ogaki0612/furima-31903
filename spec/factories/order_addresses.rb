FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { 1 }
    address_1 { 'テスト市' }
    address_2 { 'テスト町1-23' }
    building { 'テストマンション101' }
    phone_number { '09012345678' }
  end
end
