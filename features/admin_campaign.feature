Feature: Campaign administration

Scenario: Administrator navigates a paginated list of campaigns
   Given 40 campaigns exist
     And a campaign "My Campaign" exists
     And 10 coupons exist with campaign: campaign "My Campaign"
    When I go to the admin campaigns page
    Then I should see page 1 of the campaigns
     And I should see "Previous" within the page navigation
     And I should see "Next" within the page navigation
    When I follow "Next" within the page navigation
    Then I should see page 2 of the campaigns
    When I follow "Previous" within the page navigation
    Then I should see page 1 of the campaigns
    When I follow "3" within the page navigation
    Then I should see page 3 of the campaigns

Scenario: Administrator navigates to a campaign and pages through its coupons
   Given a campaign exists with name: "My Campaign"
     And 70 coupons exist with campaign: that campaign
     And a user exists with facebook_id: "facebook-user"
     And 1 coupon is assigned to the user "facebook-user"
     And I am on the admin campaigns page
    When I follow "My Campaign"
    Then I should be on the admin campaign page for "My Campaign"
     And I should see page 1 of "My Campaign"'s coupons
     And I should see "Previous" within the page navigation
     And I should see "Next" within the page navigation
    When I follow "Next" within the page navigation
    Then I should see page 2 of "My Campaign"'s coupons
    When I follow "Previous" within the page navigation
    Then I should see page 1 of "My Campaign"'s coupons
    When I follow "3" within the page navigation
    Then I should see page 3 of "My Campaign"'s coupons

Scenario: Administrator navigates to new campaign page
   Given I am on the admin campaigns page
    When I follow "New campaign"
    Then I should be on the new admin campaign page

Scenario: Administrator creates a new campaign
   Given I am on the new admin campaign page
    When I fill in "Campaign name" with "A New Campaign"
     And I fill in "Expiry date" with "2012-01-01"
     And I press "Create campaign"
    Then There should be a campaign named "A New Campaign"
     And I should be on the admin campaign page for "A New Campaign"

Scenario: Administrator creates a new campaign with coupons
   Given I am on the new admin campaign page
    When I fill in "Campaign name" with "A New Campaign"
     And I fill in "Expiry date" with "2012-01-01"
     And I attach "coupons.csv" to the campaign
     And I press "Create campaign"
    Then There should be a campaign named "A New Campaign"
     And The campaign named "A New Campaign" should have 100 coupons
     And I should be on the admin campaign page for "A New Campaign"
