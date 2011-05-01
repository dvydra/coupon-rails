require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.define do
  coupon_code { Faker::Lorem.words(3).join('-') }
  name        { Faker::Name.name }
end

Campaign.blueprint do
  name
end

Coupon.blueprint do
  code     { Sham.coupon_code }
  campaign { Campaign.make }
end
