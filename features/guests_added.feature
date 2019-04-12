Feature: See if you are attending an event

  As a visitor to the website
  So that I can see if my name was registered to an event
  I want to be able to click to see who is going to an event

  Background:
    Given the following events exist:
      | name              | description                 | date        | location                               | tickets               | capacity |
      | Pouring liquid    | Look, it changes colors     | 22-Apr-3019 | 422 Treeside Way, Berkeley, CA 94704   | stubhub.com/liquid    | 10       |
      | Other event       | Look, it changes colors     | 22-Apr-3019 | 422 Treeside Way, Berkeley, CA 94704   | stubhub.com/liquid    | 0        |
    And I am on the events page



  Scenario: I register for an event with no demographics:
    When I follow "rsvp_1"
    Then I should see "Gender"
    And I fill out the form with the following attributes:
      | firstname    | Test           |
      | lastname     | Guest          |
      | email        | test@guest.com |
    Then I should see "You have successfully registered!"
    And I should see "Test Guest"

  Scenario: Delete a guest
    When I follow "rsvp_1"
    Then I should see "Gender"
    And I fill out the form with the following attributes:
      | firstname    | Test           |
      | lastname     | Guest          |
      | email        | test@guest.com |
    Then I should see "You have successfully registered!"
    And I should see "Test Guest"

    Given I am on the events page
    When I follow "event_1"
    Then I should see "Delete"
    And I follow "Delete"
    Then I should see "Guest was successfully removed."

  Scenario: I register for an event with demographics:
    When I follow "rsvp_1"
    And I select "Undergrad" from "guest[occupation]"
    And I select "male" from "guest[gender]"
    And I select "chemistry" from "guest[department]"
    And I fill out the form with the following attributes:
      | firstname    | Test           |
      | lastname     | Guest          |
      | email        | test@guest.com |
    Then I should see "You have successfully registered!"
    And I should see "Test Guest"  

  Scenario: Capacity is reached
    When I follow "rsvp_2"
    And I fill out the form with the following attributes:
      | firstname    | Test           |
      | lastname     | Guest          |
      | email        | test@guest.com |
    Then I should see "Your registration failed, please make sure your information is correct."

  Scenario: Bad email
    When I follow "rsvp_1"
    And I fill out the form with the following attributes:
      | firstname    | Test           |
      | lastname     | Guest          |
      | email        | test           |
    Then I should see "Your registration failed, please make sure your information is correct."
