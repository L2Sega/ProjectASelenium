require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'

Before do
  $driver = Selenium::WebDriver.for :firefox
  #$driver = Selenium::WebDriver.for :chrome
  $mainurl = "http://www.petsmart.com/"
  $driver.get $mainurl
  #$driver.manage.window.maximize
  $driver.manage.timeouts.implicit_wait = 3
end

$listofgoods = "//h4[@class = 'ws-product-title fn']"
$listofpages = "(//ul[@class = 'ws-product-listing-pagination-list'])[position() < 2]/li/a"

def print_items
  # TC 15
  elements = $driver.find_elements :xpath => ""+$listofgoods+""
  if elements.empty?
    raise 'No element'
  else
    puts elements.map {|x| x.text}
  end
end

def listing(start, pages, except)
  """ listing through all pagination on a site, where:
      start - starting number of array;
      pages - array contains pages;
      except - exclude ranges(e.g. 11-20)

  """
  for i in start..pages.count-except do
    pages = $driver.find_elements(:xpath, ""+$listofpages+"")
    pages[i].click
    sleep 2
    print_items
  end
end

def sorting_price(array, high, low)
  """ sorting high to low or low to high
      TC 16-17

  """
  for i in 1..array.count-1 do
    if high
      if array[i] <= array[i-1]
        next
      else raise "Sorting hightolow is not correct"
      end
    elsif low
      if array[i] >= array[i-1]
        next
      else raise "Sorting lowtohigh is not correct "
      end
    end
  end
end

def convert_range(range)
  # return an array with max and min values or single float TC 25
  if range.include? "-"
    range.split("-").map(&:to_f)
  elsif range.include? "<="
    range.gsub!("<=", "").to_f
  elsif range.include? ">"
    range.gsub!(">", "").to_f
  end
end

def compare_value_and_range(array, range)
  """Function compares selected range (min, max) of price with prices in array
  This function for TC 24, 25

  """
  if range.is_a?(Float)
    puts "float"
    if range == 1.0
      for one in array
        if one <= range
          puts "#{one.to_f.round(1)}" + ' <= ' + "#{range.to_f.round(1)}"
        else
          raise 'Out of range'
        end
      end
    elsif range == 4.0
      for one in array
        if one > range
          puts "#{one.to_f.round(1)}" + ' > ' + "#{range.to_f.round(1)}"
        else
          raise 'Out of range'
        end
      end
    end

  elsif range.is_a?(Array)
    puts "Array"
    for one in array
      if one >= range[0] and one <= range[1]
        puts "#{one.round(1)}" + ' >= ' + "#{range[0]}" + ' and ' + "#{one.round(1)}" + ' <= ' + "#{range[1]}"
      else
        raise 'Out of range'
      end
    end
  end
end

def verifying_sub(elements, subcategory)
  #looping for verification subcategory in array TC 21-23
  array = []
  for element in elements do
    if element.text.include?(subcategory)
      array.push(element.text)
    else
      raise "No subcategory"
    end
  end
  puts array
end

