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

Then /^Check footer menu ([^"]*) with items$/ do |x|
  element = $driver.find_elements :xpath => "//div[contains(@class, 'footer-links')][position() > 1][.//h3[text() = '#{x}']]//a"
  if element.empty?
    puts 'No links'
  else
    puts element.map {|i| i.text}
  end
end

Then /^Click on ([^"]*) icon$/ do |x|
  element = $driver.find_element :xpath => "//a[text() = '#{x}']"
  element.click
end

Then /^Verify navigation to ([^"]*)$/ do |x|
  $driver.switch_to.window $driver.window_handles.last
  assert $driver.title.include?("#{x}")
end

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

def print_items
  elements = $driver.find_elements :xpath => ""+$listofgoods+""
  if elements.empty?
    raise 'No element in your submenu'
  else
    puts elements.map {|x| x.text}
  end
end

def listing(start, pages, except) # start - start of cycle; pages - array contains pages; except - exclude ranges(e.g. 11-20)
  for i in start..pages.count-except do
    pages = $driver.find_elements(:xpath, ""+$listofpages+"")
    pages[i].click
    sleep 2
    print_items
  end
end

Then /^Go through all pages and print out all given items$/ do
  pages = $driver.find_elements(:xpath, ""+$listofpages+"")
  print_items
  pages[0].click
  print_items
  listing(3, pages, 4)
  listing(3, pages, 3)
  listing(4, pages, 2)
  listing(5, pages, 1)
  listing(6, pages, 5)
end

#pages = $driver.find_elements(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[position() < 2]/li/a[.//span]")
#n = 2
#for i in pages do
#  pages = $driver.find_element(:xpath, "((//ul[@class = 'ws-product-listing-pagination-list'])[position() < 2]/li/a[.//span])[text() = '"+n.to_s+"']")
#  pages.click
#  n += 1
#end
#====================================
#for i in 1..numpages-4 do
#  pages = $driver.find_elements(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[position() < 2]/li/a")
#  pages[i].click
#end
#for i in 3..numpages-3 do
#  pages = $driver.find_elements(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[position() < 2]/li/a")
#  pages[i].click
#end
#for i in 4..numpages-2 do
#  pages = $driver.find_elements(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[position() < 2]/li/a")
#  pages[i].click
#end
#for i in 5..numpages-1 do
#  pages = $driver.find_elements(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[position() < 2]/li/a")
#  pages[i].click
#end
#for i in 6..numpages do
#  pages = $driver.find_elements(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[position() < 2]/li/a")
#  pages[i].click
#end

#Scenario 16-17
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

def sorting(array, high, low)
  for i in 1..array.count-1 do
    if high == TRUE
      if array[i] <= array[i-1]
        next
      else raise "Sorting hightolow is not correct"
      end
    elsif low == TRUE
      if array[i] >= array[i-1]
        next
      else raise "Sorting lowtohigh is not correct "
      end
    end
  end
end

Then /^Verify correct sorting ([^"]*)$/ do |x|
  page = $driver.find_element(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[1]/li[contains(@class, 'next-page')]")
  while page.displayed? do
    prices =  $driver.find_elements(:xpath, "//ul[contains(@class, 'ws-product-list pet-product')]//div[contains(@class, 'price')]/span[contains(@class, 'price-temporary')]")
    array = []
    for price in prices do
      array.push(price.text.sub!("$ ", "").to_f)
    end
    puts array
    if "#{x}" == "hightolow"
      sorting(array, true, 0)
    elsif "#{x}" == "lowtohigh"
      sorting(array, 0, true)
    end
    page.click
    sleep 2
    page = $driver.find_element(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[1]/li[contains(@class, 'next-page')]")
  end
end

#Then /^Verify correct sorting ([^"]*)$/ do |x|
#prices =  $driver.find_elements(:xpath, "//ul[contains(@class, 'ws-product-list pet-product')]//div[contains(@class, 'price')]/span[contains(@class, 'price-temporary')]")
#array = []
#for price in prices do
#  array.push(price.text.sub!("$ ", "").to_f)
#end
#if "#{x}" == "hightolow"
#  sorting(array, true, 0)
#elsif "#{x}" == "lowtohigh"
#  sorting(array, 0, true)
#end
#end

#Then /^Next page$/ do
#  page = $driver.find_element(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[1]/li[contains(@class, 'next-page')]")
#  while page.displayed? do
#    page.click
#    sleep 2
#    page = $driver.find_element(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[1]/li[contains(@class, 'next-page')]")
#  end
#end

Then /^Verify correct sorting$/ do
  page = $driver.find_element(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[1]/li[contains(@class, 'next-page')]")
  while page.displayed? do
    rates =  $driver.find_elements(:xpath, "//ul[contains(@class, 'ws-product-list pet-product')]//div[@class = 'ws-product-rating ']/span")
    array = []
    for rate in rates do
      array.push(rate.text.to_f)
    end
    puts array
    sorting(array, true, 0)
    page.click
    sleep 2
    page = $driver.find_element(:xpath, "(//ul[@class = 'ws-product-listing-pagination-list'])[1]/li[contains(@class, 'next-page')]")
  end
end
