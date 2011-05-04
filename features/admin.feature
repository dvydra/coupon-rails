Feature: Admin pages

Scenario: Administrator views admin root page
   When I go to the admin root page
   Then I should be on the admin root page
    And I should see "Home" within the admin navigation
    And I should see "Campaigns" within the admin navigation
    And I should see "Users" within the admin navigation

Scenario: Administrator navigates to admin campaigns page and back
  Given I am on the admin root page
   When I follow "Campaigns" within the admin navigation
   Then I should be on the admin campaigns page
   When I follow "Home" within the admin navigation
   Then I should be on the admin root page

Scenario: Administrator navigates to admin users page and back
  Given I am on the admin root page
   When I follow "Users" within the admin navigation
   Then I should be on the admin users page
   When I follow "Home" within the admin navigation
   Then I should be on the admin root page
