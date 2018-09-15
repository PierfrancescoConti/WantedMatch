#require "rails_helper"

Given("I am in a page") do
  visit home_path
end

When /i clink "menu" button/ do
    click_link("=")
end

Then("i should see the dropdown menu") do
  expect(page).to have_content("Help")
end
