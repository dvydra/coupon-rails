Feature: User administration

Scenario: Administrator navigates a paginated list of users
   Given 80 users exist
     And a user "My User" exists
     And 10 coupons exist with user: user "My User"
    When I go to the admin users page
    Then I should see page 1 of the users
     And I should see "Previous" within the page navigation
     And I should see "Next" within the page navigation
    When I follow "Next" within the page navigation
    Then I should see page 2 of the users
    When I follow "Previous" within the page navigation
    Then I should see page 1 of the users
    When I follow "3" within the page navigation
    Then I should see page 3 of the users

Scenario: Administrator navigates to a user and pages through their coupons
   Given a user exists with facebook_id: "facebook-user"
     And 70 coupons exist with user: that user
     And I am on the admin users page
    When I follow "facebook-user"
    Then I should be on the admin user page for "facebook-user"
     And I should see page 1 of the coupons belonging to user "facebook-user"
     And I should see "Previous" within the page navigation
     And I should see "Next" within the page navigation
    When I follow "Next" within the page navigation
    Then I should see page 2 of the coupons belonging to user "facebook-user"
    When I follow "Previous" within the page navigation
    Then I should see page 1 of the coupons belonging to user "facebook-user"
    When I follow "3" within the page navigation
    Then I should see page 3 of the coupons belonging to user "facebook-user"

# Scenario: Administrator navigates to new campaign page
#    Given I am on the admin campaigns page
#     When I follow "New campaign"
#     Then I should be on the new admin campaign page
#
# Scenario: Administrator creates a new campaign
#    Given I am on the new admin campaign page
#     When I fill in "Campaign name" with "A New Campaign"
#      And I fill in "Expiry date" with "2012-01-01"
#      And I press "Create campaign"
#     Then There should be a campaign named "A New Campaign"
#      And I should be on the admin campaign page for "A New Campaign"
#
# Scenario: Administrator creates a new campaign with coupons
#    Given I am on the new admin campaign page
#     When I fill in "Campaign name" with "A New Campaign"
#      And I fill in "Expiry date" with "2012-01-01"
#      And I attach "coupons.csv" to the campaign
#      And I press "Create campaign"
#     Then There should be a campaign named "A New Campaign"
#      And The campaign named "A New Campaign" should have 100 coupons
#      And I should be on the admin campaign page for "A New Campaign"
