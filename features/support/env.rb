require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'

Before do
  $driver = Selenium::WebDriver.for :firefox
  $mainurl = "http://www.petsmart.com/"
  $driver.get $mainurl
  #$driver.manage.window.maximize
  $driver.manage.timeouts.implicit_wait = 3
end

$listofgoods = "//h4[@class = 'ws-product-title fn']"
$listofpages = "(//ul[@class = 'ws-product-listing-pagination-list'])[position() < 2]/li/a"