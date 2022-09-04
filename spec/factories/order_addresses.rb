FactoryBot.define do
  factory :order_address do
    user_id       { Faker::Number.non_zero_digit }
    item_id       { Faker::Number.non_zero_digit }
    postcode      { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.city }
    address       { '青山1-1-1' }
    building      { '柳ビル103' }
    phone_number  { '09012345678' }
    token         {"tok_abcdefghijk00000000000000000"}
  end
end
