#1
Then /^Check that menu item ([^"]*) contains submenus$/ do |x|
  element = $driver.find_element :xpath => "//a[./span[@class = 'ws-category-title' and text() = '#{x}']]"
  $driver.mouse.move_to element
  element = $driver.find_elements :xpath => "//div[contains(@class, 'main-nav-dropdown-#{x.downcase.split.join("")}-contents')][.//ul[contains(@class, 'main-nav-dropdown-subcat-list')]]//li/a"
  if element.empty?
    raise 'No element in your submenu'
  else
    puts element.map {|n| n.text}
  end
end

#2
Then /^Check footer menu ([^"]*) with items$/ do |x|
  element = $driver.find_elements :xpath => "//div[contains(@class, 'footer-links')][position() > 1][.//h3[text() = '#{x}']]//a"
  if element.empty?
    puts 'No links'
  else
    puts element.map {|i| i.text}
  end
end

#3-8
Then /^Click on ([^"]*) icon$/ do |x|
  element = $driver.find_element :xpath => "//a[text() = '#{x}']"
  element.click
end

Then /^Verify navigation to ([^"]*)$/ do |x|
  $driver.switch_to.window $driver.window_handles.last
  assert $driver.title.include?("#{x}")
end

#9
Then /^In search type ([^"]*)$/ do |x|
  search = $driver.find_element(:id, "searchForm")
  search.send_keys x
  sbutton = $driver.find_element(:xpath, "//*[@class = 'ws-search-submit']")
  sbutton.click
  sleep 2
end

Then /^Check that ([^"]*) returned$/ do |x|
  items = $driver.find_elements(:xpath, "//h4[@class = 'ws-product-title fn']")
  for i in items do
    if i.text.include? x
      puts i.text
    else
      raise "Your element did not find"
    end
  end
end

#10
Then /^Check that no results returned or some message$/ do
  items = $driver.find_elements(:xpath, "//h1[@class = 'ws-heading']")
  for i in items do
    if i.text.include? "0 Results for:"
      puts i.text
    else
      raise "Your element did not find"
    end
  end
end

#11
Then /^in Pet service click on each item and verify that all promo messages are different$/ do
  elements = $driver.find_elements(:xpath, "//div[@id = 'services-pagination']/div[contains(@class, 'owl-page')]")
  array_of_messages = []
  message = $driver.find_elements(:xpath, "//div[@class = 'service-content']/p[@class = 'title']")
  n = 0
  for i in elements do
    i.click
    sleep 2
    array_of_messages.push(message[n].text)
    n += 1
  end
  if array_of_messages == array_of_messages.uniq
    puts array_of_messages
  else
    raise "Your messages NOT uniq"
  end
end

#12
Then /^Click ([^"]*) menu$/ do |x|
  element = $driver.find_element :xpath => "//li[@class = 'ws-common-list-item pet-main-nav-item-level1']//span[@class = 'ws-category-title' and text() = 'Dog']"
  element.click
  sleep 2
end

Then /^In "Featured Brands" check that each brand navigates to the page with brand specific items$/ do
  list_brands = $driver.find_elements :xpath => "//div[@class = 'ws-group-contents']/div[contains(@class, 'content-row--content-width spacer__bottom--tiny')]//img"
  n = 1
  for i in list_brands do
    brand = $driver.find_element :xpath => "(//div[@class = 'ws-group-contents']/div[contains(@class, 'content-row--content-width spacer__bottom--tiny')]//img)["+n.to_s+"]"
    b = brand.attribute('alt')
    brand.click
    sleep 2
    puts b
    items = $driver.find_elements :xpath => "//h4[@class = 'ws-product-title fn']"
    for item in items do
      if item.text.include? b.upcase or b.downcase or b.capitalize
        puts item.text
      else
        raise "Brand Not found"
      end
    end
    $driver.navigate.back
    n += 1
  end
end

#13
Then /^Check that each link in "Top Categories" works$/ do
  categories = $driver.find_elements(:xpath, "//div[./div[contains(@class, 'tiny clearfix')]][position() < 3]//img")
  n = 1
  for i in categories do
    link =  $driver.find_element(:xpath, "(//span[contains(@class, 'caption__quarter-width')]/a[contains(@class, 'link__medium')])["+n.to_s+"]")
    c = link.text
    link.click
    sleep 2
    label = $driver.find_element(:xpath, "//div[contains(@class, 'pet-heading')]/h3[@class = 'ws-heading ws-category-heading']")
    if label.text.include? c
      puts label.text
    else
      raise label.text + " page does not correct"
    end
    $driver.navigate.back
    n += 1
  end
end

#14
Then /^In ([^"]*) menu go to ([^"]*)$/ do |x, y|
  element1 = $driver.find_element :xpath => "//a[./span[@class = 'ws-category-title' and text() = '#{x}']]"
  $driver.mouse.move_to element1
  element2 = $driver.find_element :xpath => "//div[contains(@class, 'main-nav-dropdown-dog-contents')]//ul/li/a[.//text() = '#{y}']"
  element2.click
end

Then /^Click View 200 Items$/ do
  element = $driver.find_element :xpath => "//div[@class = 'ws-group-contents pet-pagination-contents']/a"
  element.click
  sleep 2
end

Then /^Check that 200 items displayed$/ do
  element = $driver.find_elements :xpath => "//h4[@class = 'ws-product-title fn']"
  if element.count == 200
    puts "200 items displayed"
  else
    raise "Error - count is not consistent"
  end
end

#15
Then /^Go through all pages and print out all given items$/ do
  # Before loop we need click on the second page
  pages = $driver.find_elements(:xpath, ""+$listofpages+"")
  print_items
  pages[0].click
  print_items

  # Separate pagination on a blocks where each block include range of pages e.g. [1-10], [11-17], etc.
  listing(3, pages, 4)
  listing(3, pages, 3)
  listing(4, pages, 2)
  listing(5, pages, 1)
  listing(6, pages, 5)
end

#Scenario 16-20
Then /^Set sorting to ([^"]*)$/ do |item|
  droplist = $driver.find_element(:xpath, "(//select[@name = 'SortingAttribute'])[1]")
  sel_drop = Selenium::WebDriver::Support::Select.new(droplist)
  sel_drop.select_by(:text, "#{item}")
end

Then /^Verify selected item$/ do
  droplist = $driver.find_element(:xpath, "(//select[@name = 'SortingAttribute'])[1]")
  sel_drop = Selenium::WebDriver::Support::Select.new(droplist)
  sel_drop.first_selected_option.text
end

Then /^Verify correct pricesorting ([^"]*)$/ do |x|
  page = $driver.find_element(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[1]/li[contains(@class, 'next-page')]")
  while page.displayed? do
    prices =  $driver.find_elements(:xpath, "//ul[contains(@class, 'ws-product-list pet-product')]//div[contains(@class, 'price')]/span[contains(@class, 'price-temporary')]")
    array = []
    for price in prices do
      array.push(price.text.sub!("$ ", "").to_f)
    end
    puts array
    if "#{x}" == "hightolow"
      sorting_price(array, true, 0)
    elsif "#{x}" == "lowtohigh"
      sorting_price(array, 0, true)
    end
    page.click
    sleep 2
    page = $driver.find_element(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[1]/li[contains(@class, 'next-page')]")
  end
end

#18
Then /^Verify correct rate_sorting$/ do
  page = $driver.find_element(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[1]/li[contains(@class, 'next-page')]")
  while page.displayed? do
    rates =  $driver.find_elements(:xpath, "//ul[contains(@class, 'ws-product-list pet-product')]//div[@class = 'ws-product-rating ']/span")
    array = []
    for rate in rates do
      array.push(rate.text.to_f)
    end
    puts array
    sorting_price(array, true, 0)
    page.click
    sleep 2
    page = $driver.find_element(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[1]/li[contains(@class, 'next-page')]")
  end
end

#21-23
Then /^Set filter for ([^"]*) and select ([^"]*)$/ do |category, subcategory|
  show_all = $driver.find_element(:xpath, "//div[@class = 'ws-filters ws-section'][.//legend[contains(text(), '"+category+"')]]//a[text() = 'Show all']") rescue false
  if show_all
    show_all = $driver.find_element(:xpath, "//div[@class = 'ws-filters ws-section'][.//legend[contains(text(), '"+category+"')]]//a[text() = 'Show all']")
    show_all.click
  end
  sel_sub = $driver.find_element(:xpath, "//div[@class = 'ws-filters ws-section'][.//legend[contains(text(), '"+category+"')]]//li[.//label[contains(text(), '"+subcategory+"')]]/input")
  sel_sub.click
end

Then /^Verify correct filtration ([^"]*)$/ do |subcategory|
  page = $driver.find_element(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[1]/li[contains(@class, 'next-page')]") rescue false
  if page
    while page.displayed? do
      elements = $driver.find_elements(:xpath => ""+$listofgoods+"")
      verifying_sub(elements, subcategory)

      page.click
      sleep 2
      page = $driver.find_element(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[1]/li[contains(@class, 'next-page')]")
    end
  end
  elements = $driver.find_elements(:xpath => ""+$listofgoods+"")
  verifying_sub(elements, subcategory)

end

#22
Then /^Verify correct sorting ([^"]*)$/ do |item|
  array = $driver.find_elements(:xpath, "//li[contains(@data-variation-value, '#{item}')]")
  for i in array
    if i.attribute("data-variation-value").include? item
      puts "ok"
    else
      raise "Nooooooooooooooooooooooooooooooooooo"
    end
  end
end

#24
Then /^Verify correct ([^"]*) sorting$/ do |range|
  prices = $driver.find_elements(:xpath, "//ul[contains(@class, 'ws-product-list pet-product')]//div[contains(@class, 'price')]/span[contains(@class, 'price-temporary')]")
  array_of_prices = prices.map{|m| m.text.sub!("$ ", "").to_f}
  max_min_ranges = range.gsub!("$", "").split(" - ").map(&:to_f)
  compare_value_and_range(array_of_prices, max_min_ranges)
end

#25
Then /^Verify correct ([^"]*) rate_sorting$/ do |range|
  rates = $driver.find_elements(:xpath, "//ul[contains(@class, 'ws-product-list pet-product')]//div[contains(@class, 'rating')]/div/span")
  array_of_rates = rates.map{|m| m.text.to_f}
  compare_value_and_range(array_of_rates, convert_range(range))
end

#28-30
Then /^Add ([^"]*) random items into compare mode$/ do |count|
  checkbox = $driver.find_elements(:xpath, "//div[@class = 'ws-compare-link-add-container']//input[@type = 'checkbox']")
  for i in checkbox.sample(count.to_i)
    i.click
    sleep 5
  end
  message = $driver.find_elements(:xpath, "//div[@class = 'kor-overlay-content']/div")
  if message.count > 0
    puts "Error message displayed:   -    " + message.text
  else raise "Error message is not displayed"
  end
end

#31
Then /^Remove one item from compare mode$/ do
  compare_list = $driver.find_elements(:xpath, "//ul[@class = 'ws-product-list pet-compare-list']//a[contains(@class, 'link-remove')]")
  compare_list[0].click
end

#32
Then /^Click random item$/ do
  items = $driver.find_elements(:xpath, $listofgoods)
  random_item = items.sample
  random_item.click
end

Then /^Select ([^"]*) Size and ([^"]*) Flavor if not selected by default$/ do |size, flavor|
  size_box = $driver.find_element(:xpath, "//div[contains(@aria-labelledby, 'List_SizeCode')]//div[@class = 'kor-select-text-viewport-contents']")rescue false
  if size_box
    size_box.click
    size_item = $driver.find_element(:xpath, "//ul[contains(@class, 'list-SizeCode')]/li["+(size.to_i+1).to_s+"]")
    size_item.click
    sleep 1
  end

  flavor_box = $driver.find_element(:xpath, "//div[contains(@aria-labelledby, 'List_Flavor')]//div[@class = 'kor-select-text-viewport-contents']")rescue false
  if flavor_box
    flavor_box.click
    flavor_item = $driver.find_element(:xpath, "//ul[contains(@class, 'Flavor')]/li["+(flavor.to_i+1).to_s+"]")
    flavor_item.click
  end
end

Then /^Click Add to Cart button$/ do
  add_button = $driver.find_element(:xpath, "//button[text() = 'Add to Cart']")
  add_button.click
  sleep 2
end

Then /^Verify that quantity of items in the cart is equal to ([^"]*)$/ do |count|
  cart = $driver.find_element(:xpath, "//a[contains(@class, 'ws-minicart-link')]")
  $driver.mouse.move_to cart
  cart_count = $driver.find_element(:xpath, "//span[contains(@class, 'items-amount')]")
  if cart_count.text == count
    puts "Quantity is consistent with cart"
  else
    raise "Quantity is different"
  end
end

#33
Then /^Verify error message displayed$/ do
  error_msg = $driver.find_element(:xpath, "//div[contains(@class, 'error-text-heading')]")rescue false
  if error_msg
    puts "Error message: " + error_msg.text + " displayed"
  else
    puts "No error message"
  end
end

#34
Then /^Remove 1 item from the cart$/ do
  remove = $driver.find_element(:xpath, "//button[contains(@class, 'ws-cart-remove')]")
  remove.click
  sleep 1
end

Then /^Verify that cart is empty$/ do
  cart = $driver.find_element(:xpath, "//a[contains(@class, 'ws-minicart-link')]")
  $driver.mouse.move_to cart
  empty_cart = $driver.find_element(:xpath, "//p[contains(text(), 'empty')]")rescue false
  if empty_cart
    puts "Cart is empty"
  else
    raise "Cart is no empty"
  end
end

#35
Then /^Click Secure checkout button and verify you are on Checkout page$/ do
  checkout_button = $driver.find_element(:xpath, "//button[@name = 'secureCheckout']")
  checkout_button.click
  sleep 2
  checkout_page = $driver.find_element(:xpath, "//h3[@class = 'ws-heading ' and text() = 'Checkout']")rescue false
  if checkout_page
    puts "Page displayed"
  else
    raise "No checkout page"
  end
end

#36
Then /^Go to the next page$/ do
  next_page = $driver.find_element(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[1]/li[contains(@class, 'next-page')]")
  next_page.click
  sleep 2
end

