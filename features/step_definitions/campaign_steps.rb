
Then /^I should see page (\d+) of the (campaigns)$/ do |page, dummy|
  Campaign.paginate(:page => page).each do |campaign|
    Then "I should see \"#{campaign.name}\" within the campaign list"
    Then "I should see \"#{campaign.coupons.count}\" within the campaign list"
  end
end
