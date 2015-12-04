Feature: Test plan sample
#  base url: "http://www.petsmart.com/"
  #1
  Scenario: Main page functionality - header navigation
    Then Check that menu item Dog contains submenus
    Then Check that menu item Cat contains submenus
    Then Check that menu item Fish contains submenus
    Then Check that menu item Bird contains submenus
    Then Check that menu item Reptile contains submenus
    Then Check that menu item Small Pet contains submenus
    Then Check that menu item Sale contains submenus
  #2
  Scenario: Main page functionality - footer navigation
    Then Check footer menu Store Services with items
    Then Check footer menu PetSmart Cares with items
    Then Check footer menu Shop With Us with items
    Then Check footer menu Education with items
    Then Check footer menu About PetSmart with items

  #3
  Scenario: Main page functionality - external links - facebook
    Then Click on Facebook icon
    Then Verify navigation to PetSmart

  #4
  Scenario: Main page functionality - external links - hangouts
    Then Click on Twitter icon
    Then Verify navigation to Твиттер

  #5
  Scenario: Main page functionality - external links - twitter
    Then Click on Google Plus icon
    Then Verify navigation to Google+

  #6
  Scenario: Main page functionality - external links - instagram
    Then Click on Instagram icon
    Then Verify navigation to Instagram

  #7
  Scenario: Main page functionality - external links - pinterest
    Then Click on Pinterest icon
    Then Verify navigation to Pinterest

  #8
  Scenario: Main page functionality - external links - youtube
    Then Click on YouTube icon
    Then Verify navigation to YouTube

  #9
  Scenario: Main page functionality - search - valid search
    Then In search type Food
    Then Check that Food returned

  #10
  Scenario: Main page functionality - search - invalid search
    Then In search type crocodile
    Then Check that no results returned or some message

  #11
  Scenario: Main page functionality - pet services wrapper
    Then in Pet service click on each item and verify that all promo messages are different

  #12
  Scenario: Dog - Food and health - Brands
    Then Click Dog menu
    Then In "Featured Brands" check that each brand navigates to the page with brand specific items

  #13
  Scenario: Dog - Food and health - top categories
    Then Click Dog menu
    Then Check that each link in "Top Categories" works

  #14
  Scenario: Dog - Food - see 200 items verification
    Then In Dog menu go to Food
    Then Click View 200 Items
    Then Check that 200 items displayed

  #15
  Scenario: Dog - Food - pagination verification
    Then In Dog menu go to Food
    Then Go through all pages and print out all given items

  #16
  Scenario: Dog - Food - sorting - price high to low
    Then In Dog menu go to Food
    Then Set sorting to Price: High to Low
    Then Verify selected item
    Then Verify correct sorting hightolow

  #17
  Scenario: Dog - Food - sorting - price low to high
    Then In Dog menu go to Food
    Then Set sorting to Price: Low to High
    Then Verify selected item
    Then Verify correct sorting lowtohigh

  #18
  Scenario: Dog - Food - sorting - top rated
    Then In Dog menu go to Food
    Then Set sorting to Top Rated
    Then Verify selected item
    Then Verify correct sorting

  #19
  Scenario: Dog - Food - sorting - best sellers
    Then In Dog menu go to Food
    Then Set sorting to Best Sellers
    Then Verify selected item
#
  #20
  Scenario: Dog - Food - sorting - new arrivals
    Then In Dog menu go to Food
    Then Set sorting to New Arrivals
    Then Verify selected item

#  Scenario: Dog - Food - filter - Brand
#    Then In "Dog" menu go to "Food"
#    Then Set filter for "Brand"
#    Then Verify correct sorting
#
#  Scenario: Dog - Food - filter - Flavor
#    Then In "Dog" menu go to "Food"
#    Then Set filter for "Flavor"
#    Then Verify correct sorting
#
#  Scenario: Dog - Food - filter - Breed
#    Then In "Dog" menu go to "Food"
#    Then Set filter for "Breed"
#    Then Verify correct sorting
#
#  Scenario: Dog - Food - filter - Price
#    Then In "Dog" menu go to "Food"
#    Then Set filter for "Price"
#    Then Verify correct sorting
#
#  Scenario: Dog - Food - filter - Rating
#    Then In "Dog" menu go to "Food"
#    Then Set filter for "Rating"
#    Then Verify correct sorting
#
#  Scenario: Dog - Food - filter - Ways To Shop
#    Then In "Dog" menu go to "Food"
#    Then Set filter for "Ways to Shop"
#    Then Verify correct sorting
#
#  Scenario: Dog - Food - filter - Health Consideration
#    Then In "Dog" menu go to "Food"
#    Then Set filter for "Health Consideration"
#    Then Verify correct sorting
#
#  Scenario: Dog - Food - comparing - adding 2 items
#    Then In "Dog" menu go to "Food"
#    Then Add 2 random items into compare mode
#
#  Scenario: Dog - Food - comparing - adding 3 items
#    Then In "Dog" menu go to "Food"
#    Then Add 3 random items into compare mode
#
#  Scenario: Dog - Food - comparing - adding more then 3 items
#    Then In "Dog" menu go to "Food"
#    Then Add 4 random items into compare mode
#
#  Scenario: Dog - Food - comparing - removing 1-3 items
#    Then In "Dog" menu go to "Food"
#    Then Add 3 random items into compare mode
#    Then Remove one item from compare mode
#    Then Remove one item from compare mode
#    Then Remove one item from compare mode
#
#  Scenario: Dog - Shopping - 1 item to cart - all fine
#
#  Scenario: Dog - Shopping - 1 item to cart - size, quantity and flavor not selected
#
#  Scenario: Dog - Shopping - 1 item to cart with removing
#
#  Scenario: Dog - Shopping - 1 item to cart with proceeding
#
#  Scenario: Dog - Shopping - more then 1 item to cart with removing of 1 item




















