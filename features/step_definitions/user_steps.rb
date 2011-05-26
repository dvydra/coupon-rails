
Then /^I should see page (\d+) of the (users)$/ do |page, dummy|
  User.paginate(:page => page).each do |user|
    Then "I should see \"#{user.facebook_id}\" within the user list"
    Then "I should see \"#{user.coupons.count}\" within the user list"
  end
end

# Then /^There should be a campaign named \"([^\"]+)\"$/ do |campaign_name|
#   Campaign.find_by_name(campaign_name).should_not be_nil
# end
#
# Then /^The campaign named "([^"]*)" should have (\d+) coupons$/ do |campaign_name, coupon_count|
#   Campaign.find_by_name(campaign_name).coupons.should have(coupon_count.to_i).coupons
# end

Then /^I should see page (\d+) of the coupons belonging to user \"([^"]+)\"$/ do |page, facebook_id|
  user = User.find_by_facebook_id(facebook_id)
  user.coupons.paginate(:page => page).each do |coupon|
    Then "I should see \"#{coupon.code}\" within the coupon list"
  end
end

Given /^(\d+) coupons? (?:is|are) assigned to the user "([^"]*)"$/ do |coupon_count, facebook_id|
  user = User.find_by_facebook_id(facebook_id)
  Coupon.find(:all, :limit => coupon_count.to_i).each do |coupon|
    coupon.update_attribute(:user, user)
  end
end

# When /^I attach \"([^"]+)\" to (the campaign)$/ do |file, dummy|
#   attach_file('coupons_file', full_path_for(file))
# end
#
# def full_path_for(file)
#   Rails.root.join('features', 'uploads', file).to_s
# end
