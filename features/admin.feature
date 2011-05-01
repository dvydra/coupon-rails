Feature: Admin page

Scenario: Administrator views admin root page
   When I go to the admin root page
   Then I should be on the admin root page
    And I should see "Home" within the admin navigation
    And I should see "Campaigns" within the admin navigation
    And I should see "Coupons" within the admin navigation
    And I should see "Users" within the admin navigation

Scenario: Administrator navigates to admin campaigns page and back
  Given I am on the admin root page
   When I follow "Campaigns" within the admin navigation
   Then I should be on the admin campaigns page
   When I follow "Home" within the admin navigation
   Then I should be on the admin root page

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

Scenario: Administrator navigates to admin coupons page and back
  Given I am on the admin root page
   When I follow "Coupons" within the admin navigation
   Then I should be on the admin coupons page
   When I follow "Home" within the admin navigation
   Then I should be on the admin root page

Scenario: Administrator navigates to admin users page and back
  Given I am on the admin root page
   When I follow "Users" within the admin navigation
   Then I should be on the admin users page
   When I follow "Home" within the admin navigation
   Then I should be on the admin root page

Scenario: Administrator navigates a paginated list of coupons
   Given 100 coupons exist
    When I go to the admin coupons page
    Then I should see page 1 of the coupons
     And I should see "Previous" within the page navigation
     And I should see "Next" within the page navigation
    When I follow "Next" within the page navigation
    Then I should see page 2 of the coupons
    When I follow "Previous" within the page navigation
    Then I should see page 1 of the coupons
    When I follow "3" within the page navigation
    Then I should see page 3 of the coupons
