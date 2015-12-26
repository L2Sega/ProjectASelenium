Feature: Test plan sample
#base url: "http://www.petsmart.com/"
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
    Then Verify correct pricesorting hightolow

  #17
  Scenario: Dog - Food - sorting - price low to high
    Then In Dog menu go to Food
    Then Set sorting to Price: Low to High
    Then Verify selected item
    Then Verify correct pricesorting lowtohigh

  #18
  Scenario: Dog - Food - sorting - top rated
    Then In Dog menu go to Food
    Then Set sorting to Top Rated
    Then Verify selected item
    Then Verify correct rate_sorting

  #19
  Scenario: Dog - Food - sorting - best sellers
    Then In Dog menu go to Food
    Then Set sorting to Best Sellers
    Then Verify selected item

  #20
  Scenario: Dog - Food - sorting - new arrivals
    Then In Dog menu go to Food
    Then Set sorting to New Arrivals
    Then Verify selected item

  #21
  Scenario: Dog - Food - filter - Brand
    Then In Dog menu go to Food
    Then Set filter for Brand and select Authority
    Then Verify correct filtration Authority

  #22
  Scenario: Dog - Food - filter - Flavor
    Then In Dog menu go to Food
    Then Set filter for Flavor and select Beef
    Then Verify correct sorting Beef

  #23
  Scenario: Dog - Food - filter - Breed
    Then In Dog menu go to Food
    Then Set filter for Breed and select Boxer
    Then Verify correct filtration Boxer

  #24
  Scenario: Dog - Food - filter - Price
    Then In Dog menu go to Food
    Then Set filter for Price and select $10 - $15
    Then Verify correct $10 - $15 sorting

  #25
  Scenario: Dog - Food - filter - Rating
    Then In Dog menu go to Food
    Then Set filter for By Product Rating and select <=1
    Then Verify correct <=1 rate_sorting

  #26
  Scenario: Dog - Food - filter - Ways To Shop
    Then In Dog menu go to Food
    Then Set filter for More Ways To Shop and select Featured

  #27
  Scenario: Dog - Food - filter - Health Consideration
    Then In Dog menu go to Food
    Then Set filter for Health Consideration and select Brain Development

  #28
  Scenario: Dog - Food - comparing - adding 2 items
    Then In Dog menu go to Food
    Then Add 2 random items into compare mode

  #29
  Scenario: Dog - Food - comparing - adding 3 items
    Then In Dog menu go to Food
    Then Add 3 random items into compare mode

  #30
  Scenario: Dog - Food - comparing - adding more then 3 items
    Then In Dog menu go to Food
    Then Add 4 random items into compare mode

  #31
  Scenario: Dog - Food - comparing - removing 1-3 items
    Then In Dog menu go to Food
    Then Add 3 random items into compare mode
    Then Remove one item from compare mode
    Then Remove one item from compare mode
    Then Remove one item from compare mode

  #32
  Scenario: Dog - Shopping - 1 item to cart - all fine
    Then In Dog menu go to Food
    Then Click random item
    Then Select 1 Size and 1 Flavor if not selected by default
    Then Click Add to Cart button
    Then Verify that quantity of items in the cart is equal to 1

  #33
  Scenario: Dog - Shopping - 1 item to cart - size, quantity and flavor not selected
    Then In Dog menu go to Food
    Then Click random item
    Then Click Add to Cart button
    Then Verify error message displayed

  #34
  Scenario: Dog - Shopping - 1 item to cart with removing
    Then In Dog menu go to Food
    Then Click random item
    Then Select 1 Size and 1 Flavor if not selected by default
    Then Click Add to Cart button
    Then Verify that quantity of items in the cart is equal to 1
    Then Remove 1 item from the cart
    Then Verify that cart is empty

  #35
  Scenario: Dog - Shopping - 1 item to cart with proceeding
    Then In Dog menu go to Food
    Then Click random item
    Then Select 1 Size and 1 Flavor if not selected by default
    Then Click Add to Cart button
    Then Verify that quantity of items in the cart is equal to 1
    Then Click Secure checkout button and verify you are on Checkout page

  #36
  Scenario: Dog - Shopping - more then 1 item to cart with removing of 1 item
    Then In Dog menu go to Food
    Then Click random item
    Then Select 1 Size and 1 Flavor if not selected by default
    Then Click Add to Cart button
    Then In Dog menu go to Food
    Then Go to the next page
    Then Click random item
    Then Select 1 Size and 1 Flavor if not selected by default
    Then Click Add to Cart button
    Then Verify that quantity of items in the cart is equal to 2
    Then Remove 1 item from the cart
    Then Verify that quantity of items in the cart is equal to 1



















