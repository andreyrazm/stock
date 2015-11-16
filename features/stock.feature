# Non Functional Requirements:
#
# The application must be implemented in latest Rails 4.2.4
# Source code must be placed into Github or Bitbucket as open source project
# Challenge result is link to the application repository
# It is a plus if this feature is automatically runnable by Cucumber (https://cucumber.io/)
#
# Codeship.io
# Create codeship.io project and invite janno@deskrock.ee to this project.
# Tests must run after every commit to github
# Sanity cheks must run (using codeship) after every commit to github (rubocop). Use best practices.
# Application can be deployed to the appserver with capistrano

Feature: Calculate stock productivity
  In order to manage and estimate my stock
  I must be able to calculate and store stock data

  @javascript
  Scenario: Calculate prices

    When I open the application url
    Then I must see the front page with application title "Stock productivity calculator"

    When I press button "Enter new stock"
    Then I must see the page with title "Enter stock details"
    And I must be able to enter the following values:
      | Name       | Company XYZ | required string  |
      | Price      | 2.00        | required decimal |
      | Quantity   | 200         | required integer |
      | Percentage | 3.00        | required decimal |
      | Years      | 10          | required integer |
    And I press button "Calculate"
    Then I must see the page with title "Calculation result"
    And I must see the original input data:
      | Name       | Company XYZ |
      | Price      | 2.0         |
      | Quantity   | 200         |
      | Percentage | 3.0         |
      | Years      | 10          |
    And list of stock values for each year:
      | 0  | 400.00 |
      | 1  | 412.00 |
      | 2  | 424.36 |
      | 3  | 437.09 |
      | 4  | 450.20 |
      | 5  | 463.71 |
      | 6  | 477.62 |
      | 7  | 491.95 |
      | 8  | 506.71 |
      | 9  | 521.91 |
      | 10 | 537.57 |
    And the stock growth is shown as a visual graph
    And the stock data must be saved into the database for later review

    When I click "Back"
    Then I must see the page with title "Enter stock details"

  @javascript
  Scenario: View exisiting calculations
    Given the web applications runs on Heroku
    Given the system has already calculated stocks
      | name         | price  | quantity | percentage | years |
      | Apple        | 172.00 | 10       | 5.00       | 10    |
      | Microsoft    | 30     | 25       | 1.25       | 5     |

    When I open the application url
    Then I must see the front page with application title "Stock productivity calculator"
    And I must see a table of saved stocks:
      | Name         | Price  | Quantity | Percentage | Years |
      | Apple        | 172.0  | 10       | 5.0        | 10    |
      | Microsoft    | 30.0   | 25       | 1.25       | 5     |

    When I click on the calculated line "Apple"
    Then I must see the already calculated data

    When I click "Back"
    Then I must see the front page with application title "Stock productivity calculator"