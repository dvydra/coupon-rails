
Then /^I should see page (\d+) of the (coupons)$/ do |page, dummy|
  Coupon.paginate(:page => page).each do |coupon|
    Then "I should see \"#{coupon.code}\" within the coupon list"
    Then "I should see \"#{coupon.campaign.name}\" within the coupon list"
  end
end
