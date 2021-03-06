Feature: Add and view tasks

  As a administrator on the website
  So that I can organize event preparation
  I want to be able to add and view tasks

  Background:
    Given the following events exist:
      | name              | description                 | date        | location                               | capacity | price |
      | Pouring liquid    | Look, it changes colors     | 22-Apr-3019 | 422 Treeside Way, Berkeley, CA 94704   | 10       | 0     |
    And for Pouring liquid the following tasks exist:
      | name              | description                 | deadline        |
      | get liquid   | Look, it changes colors     | 28-Apr-3019 |

  Scenario: Correctly stores tasks
    Then 1 tasks should exist

  Scenario: I can view a task:
    Given I am logged in as a volunteer named "Biff Wallace"
    And I am on the tasks page for the first event
    Then I should see "get liquid"

  Scenario: I can edit a task:
    Given I am logged in as an admin named "Zip Zappity"
    And I am on the tasks page for the first event
    When I edit get liquid to:
    | name              | description                 | deadline        |
    | new liquid        | Look, it changes colors     | 28-Apr-3019     |
    And I follow "show_1"
    Then I should see "new liquid"

  Scenario: Edit as admin:
    Given I am logged in as an admin named "Zip Zappity"
    And I am on the edit page of the first task of the first event
    And I submit the form with the following attributes:
      | name    | whatever  |
      | description     | a chore  |
    Then I should see "whatever"

  Scenario: Incorrectly edit a task:
    Given I am logged in as an admin named "Zip Zappity"
    And I am on the edit page of the first task of the first event
    And I submit the form with the following attributes:
      | name    |  |
      | description        |           |
    Then I should see "Your task edit failed."

  Scenario: Add task as admin:
    Given I am logged in as an admin named "Zip Zappity"
    And I am on the add task page for the first event
    And I submit the form with the following attributes:
      | name    | whatever  |
      | description     | a chore  |
    Then I should see "You have successfully added a new task!"

  Scenario: I can delete a task
    Given I am logged in as an admin
    And I am on the tasks page for the first event
    When I follow "destroy_1"
    Then I should not see "get liquid"
    And 0 tasks should exist

  Scenario: Incorrectly add a task:
    Given I am logged in as an admin
    And I am on the tasks page for the first event
    When I follow "Add Task"
    And I submit the form with the following attributes:
      | description     | a chore  |
    Then I should see "Your task creation failed."
