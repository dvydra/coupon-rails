
Then /^I should see page (\d+) of the (campaigns)$/ do |page, dummy|
  Campaign.paginate(:page => page).each do |campaign|
    Then "I should see \"#{campaign.name}\" within the campaign list"
    Then "I should see \"#{campaign.coupons.count}\" within the campaign list"
  end
end

Then /^There should be a campaign named \"([^\"]+)\"$/ do |campaign_name|
  Campaign.find_by_name(campaign_name).should_not be_nil
end

Then /^The campaign named "([^"]*)" should have (\d+) coupons$/ do |campaign_name, coupon_count|
  Campaign.find_by_name(campaign_name).coupons.should have(coupon_count.to_i).coupons
end

Then /^I should see page (\d+) of \"([^"]+)\"'s coupons$/ do |page, campaign_name|
  campaign = Campaign.find_by_name(campaign_name)
  campaign.coupons.paginate(:page => page).each do |coupon|
    Then "I should see \"#{coupon.code}\" within the coupon list"
  end
end

When /^I attach \"([^"]+)\" to (the campaign)$/ do |file, dummy|
  attach_file('coupons_file', full_path_for(file))
end

def full_path_for(file)
  Rails.root.join('features', 'uploads', file).to_s
end
