Feature: Events Admin
  As an Events Administrator,
  When I visit the Administration Panel,
  I want to be able to administrate events.
  
  Scenario: Regular users should not have access to the admin panel or sub-panels
    Given I am not logged in as admin user
    When I access the admin panel as regular user
    Then I should be presented with a login screen
    When I try to access the events admin panel as regular user directly
    Then I should be redirected to the login screen
  
  Scenario: Admin Users can access the admin panel and sub-panels
    Given I am logged in as admin user
    When I access the admin panel
    Then I should have access to the active admin dashboard
    And I should have access to the Events admin panel
    
  Scenario: Admin Users can create a new event
    Given I am logged in as admin user
    When I access the events admin panel
    Then I should see the option to create a new event
    When I visit the new event page
    Then I should be able to create a new event  
  
  
