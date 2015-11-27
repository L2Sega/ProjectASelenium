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