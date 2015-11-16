
When(/^I open the application url$/) do
  visit root_path
end

Then(/^I must see the front page with application title "(.*?)"$/) do |title|
  page.should have_content(title)
end

When(/^I press button "(.*?)"$/) do |button|
  click_on(button)
end

Then(/^I must see the page with title "(.*?)"$/) do |title|
  page.should have_content(title)
end

Then(/^I must be able to enter the following values:$/) do |table|
  table.raw.each do |r|
    fill_in(r[0], with: r[1])
  end
  # save_and_open_page
end

Then(/^I must see the original input data:$/) do |table|
  rows = page.find('.stock-table').all('tr')
  table_arr = rows.map { |r| r.all('th,td').map(&:text) }
  table.diff!(table_arr)
end

Then(/^list of stock values for each year:$/) do |table|
  rows = page.find('.shares-table tbody').all('tr')
  table_arr = rows.map { |r| r.all('td').map(&:text) }
  table.diff!(table_arr)
end

Then(/^the stock growth is shown as a visual graph$/) do
  page.should have_selector('.highcharts-container')
end

Then(/^the stock data must be saved into the database for later review$/) do
  CapitalStock.exists?(name: 'Company XYZ')
end

When(/^I click "(.*?)"$/) do |button|
  click_on(button)
end

Given(/^the system has already calculated stocks$/) do |table|
  CapitalStock.create(table.hashes)
end

Then(/^I must see a table of saved stocks:$/) do |table|
  rows = page.find('.table').all('tr')
  table_arr = rows.map { |r| r.all('th,td').map { |c| c.text unless ['Delete', 'Edit', ''].include?(c.text) }.compact }
  puts table_arr
  table.diff!(table_arr)
end

When(/^I click on the calculated line "(.*?)"$/) do |link|
  # save_and_open_page
  click_on(link)
end

Then(/^I must see the already calculated data$/) do
  page.should have_selector('.stock-table')
  page.should have_selector('.shares-table')
  page.should have_selector('.highcharts-container')
end

Given /^the web applications runs on (.*?)$/ do |name|
  puts Socket.gethostname
end