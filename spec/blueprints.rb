require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.define do
  coupon_code            { Faker::Lorem.words(3).join('-') }
  name                   { Faker::Name.name }
  date(:unique => false) { Date.today }
  facebook_id            { Faker::Lorem.words(2).join('-') }
end

Campaign.blueprint do
  name
  expiry_date { Sham.date + 1.month }
end

Coupon.blueprint do
  code     { Sham.coupon_code }
  campaign { Campaign.make }
end

User.blueprint do
  facebook_id
end