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
