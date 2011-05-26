require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.define do
  coupon_code            { Faker::Lorem.words(3).join('-') }
  name                   { Faker::Name.name }
  date(:unique => false) { Date.today }
end

Campaign.blueprint do
  name
  expiry_date { Sham.date + 1.month }
end

Coupon.blueprint do
  code     { Sham.coupon_code }
  campaign { Campaign.make }
end
