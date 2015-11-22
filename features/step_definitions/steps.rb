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

