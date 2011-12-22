@categories
Feature: Categories
  In order to have categories on my website
  As an administrator
  I want to manage categories

  Background:
    Given I am a logged in refinery user
    And I have no categories

  @categories-list @list
  Scenario: Categories List
   Given I have categories titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of categories
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @categories-valid @valid
  Scenario: Create Valid Category
    When I go to the list of categories
    And I follow "Add New Category"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 category

  @categories-invalid @invalid
  Scenario: Create Invalid Category (without name)
    When I go to the list of categories
    And I follow "Add New Category"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 categories

  @categories-edit @edit
  Scenario: Edit Existing Category
    Given I have categories titled "A name"
    When I go to the list of categories
    And I follow "Edit this category" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of categories
    And I should not see "A name"

  @categories-duplicate @duplicate
  Scenario: Create Duplicate Category
    Given I only have categories titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of categories
    And I follow "Add New Category"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 categories

  @categories-delete @delete
  Scenario: Delete Category
    Given I only have categories titled UniqueTitleOne
    When I go to the list of categories
    And I follow "Remove this category forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 categories
 